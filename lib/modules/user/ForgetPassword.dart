import 'package:flutter/material.dart';
import 'package:egyuide/utilities/components.dart';
import 'package:egyuide/utilities/constants.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: kGreen,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/imges/wasef.png'),fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
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
                          invisible: false),
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
  }
}
