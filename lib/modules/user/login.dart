import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/layout/home.dart';
import 'package:egyuide/models/LoginModel.dart';
import 'package:egyuide/modules/user/SignUp.dart';
import 'package:egyuide/modules/user/cubit/cubit.dart';
import 'package:egyuide/modules/user/cubit/states.dart';
import 'package:egyuide/utilities/cache_helper.dart';
import 'package:egyuide/utilities/dio_helper.dart';
import 'package:egyuide/utilities/end_points.dart';
import 'package:flutter/material.dart';
import 'package:egyuide/utilities/components.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final userName = TextEditingController();
  final password = TextEditingController();
  final frmkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit2 = AppCubit.get(context);
        return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async {
          if(state is LoginSuccessState)
          {
            CacheHelper.saveData(key: 'token', value: state.loginModel.accessToken);
            CacheHelper.saveData(key: 'username', value: state.loginModel.data!.name);
            CacheHelper.saveData(key: 'email', value: state.loginModel.data!.email);
            CacheHelper.saveData(key: 'userID', value: state.loginModel.data!.userID);
            username = await CacheHelper.getData(key: 'username');
            email = await CacheHelper.getData(key: 'email');
            token = await CacheHelper.getData(key: 'token');
            userID = await CacheHelper.getData(key: 'userID');
            userID2 = await CacheHelper.getData(key: 'userID');

            cubit2.getHomePosts();
            cubit2.getTopRanked();
            cubit2.updatedUnFollowedUsers();

            NavigateToAndFinish(context, widget: Home());

            showMessage(message: 'تم تسجيل الدخول بنجاح', state: ToastStates.success);


          }
          if(state is LoginErrorState)
          {
            showMessage(message: 'خطأ في البيانات', state: ToastStates.error);
          }

        } ,
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: cubit2.darkMode ? Colors.black : Colors.white,
            body: SafeArea(
              child: Form(
                key: frmkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: KtopLogo(),
                    ),
                    Expanded(
                      flex: 1,
                      child: topBoldText(text: "Welcome Back !"),
                    ),
                    Expanded(
                      flex: 1,
                      child: topGreyText(text: "Log in to your account"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          InputField(
                            hintText: '    User Name',
                            icon: Icons.person,
                            invisible: true,
                            controller: userName,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InputField(
                            hintText: '    Password',
                            icon: Icons.lock,
                            invisible: true,
                            controller: password,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RightText(),
                    ),
                    if(state is LoginLoadingState)
                      Center(child: CircularProgressIndicator(color: Color(0xFFFF757C),)),
                    if(state is! LoginLoadingState)
                      Expanded(
                      flex: 1,
                      child: wideActionButton(
                        hint: 'Log in',
                        onPressed: ()
                        {
                          setState(() {
                            print('clicked');
                          });
                          if (frmkey.currentState!.validate())
                            {
                              cubit.getLoginData(email: userName.text, password: password.text);
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
                                image: AssetImage('assets/imges/google_logo.png'),
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
                          bottomConstantText(text: "Don't have an account?"),
                          SizedBox(
                            width: 10,
                          ),
                          redircetText(
                            text: "Sign up here",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
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
