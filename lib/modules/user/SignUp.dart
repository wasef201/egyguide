import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/layout/home.dart';
import 'package:egyuide/modules/user/cubit/cubit.dart';
import 'package:egyuide/modules/user/cubit/states.dart';
import 'package:egyuide/utilities/cache_helper.dart';
import 'package:egyuide/utilities/components.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userEmail = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final frmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {} ,
      builder: (context, state) {
        var cubit2 = AppCubit.get(context);
        return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async {
          if (state is RegisterSuccessState) {

            CacheHelper.saveData(key: 'token', value: state.registerModel.accessToken);
            CacheHelper.saveData(key: 'username', value: state.registerModel.data!.name);
            CacheHelper.saveData(key: 'email', value: state.registerModel.data!.email);
            CacheHelper.saveData(key: 'userID', value: state.registerModel.data!.userID);


            username = await CacheHelper.getData(key: 'username');
            email = await CacheHelper.getData(key: 'email');
            token = await CacheHelper.getData(key: 'token');
            userID = await CacheHelper.getData(key: 'userID');

            cubit2.getHomePosts();
            cubit2.getTopRanked();
            cubit2.updatedUnFollowedUsers();
            NavigateToAndFinish(context, widget: Home());

            showMessage(message: 'تم التسجيل بنجاح!', state: ToastStates.success);




          }
          if (state is RegisterErrorState)
            showMessage(message: 'خطأ في البيانات', state: ToastStates.error);

        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

              return Scaffold(
              backgroundColor: cubit2.darkMode ? Colors.black26 : Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Form(
                        key: frmKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 3,
                              child: KtopLogo(),
                            ),
                            Expanded(
                              flex: 1,
                              child: topBoldText(
                                text: "Hello !",
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: topGreyText(text: "Create Your account"),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  InputField(
                                    hintText: 'Email',
                                    icon: Icons.email,
                                    invisible: false,
                                    controller: userEmail,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputField(
                                    hintText: 'User Name',
                                    icon: Icons.person,
                                    invisible: false,
                                    controller: userName,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputField(
                                    hintText: 'Password',
                                    icon: Icons.lock,
                                    invisible: true,
                                    controller: password,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if(state is RegisterLoadingState)
                              Center(child: CircularProgressIndicator(color: Color(0xFFFF757C),)),
                            if(state is! RegisterLoadingState)
                              Expanded(
                              flex: 1,
                              child: wideActionButton(
                                hint: "Sign Up",
                                onPressed: () {
                                  if (frmKey.currentState!.validate()) {
                                    cubit.registerUser(context,
                                        username: userName.text,
                                        email: userEmail.text,
                                        password: password.text);
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Seperator(),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: socialLinkWithImage(
                                        image: AssetImage(
                                            'assets/imges/google_logo.png'),
                                        text: "Google"),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: socialLink(
                                      icon: kFacebookIcon,
                                      text: "Facebook",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  bottomConstantText(
                                      text: "Already have an account ?"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  redircetText(
                                    text: "Log in here",
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
        },
      );
      },
    );
  }
}
