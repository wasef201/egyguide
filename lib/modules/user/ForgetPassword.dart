import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:egyuide/utilities/components.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: cubit.darkMode ? Color(0xff0E1D36) : Colors.white,
        appBar: AppBar(
          backgroundColor: cubit.darkMode ? Color(0xff0E1D36) : Colors.white,
          elevation: 0,
          leading: BackButton(
            color: kGreen,
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imges/wasef.png'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.lock,
                            color: kGreen,
                            size: 25,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Forget Password ?",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              fontSize: 24,
                              color: kGreen,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Enter your phone number. you will receive a code to create a new password ",
                            style: kHintTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        InputField(
                          hintText: "Enter your phone number",
                          icon: Icons.phone,
                          invisible: false,
                          controller: phone,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 50, child: wideActionButton(hint: "Sign Up")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      },
    );
  }
}
