
import 'package:egyuide/modules/user/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:egyuide/utilities/components.dart';
import 'package:egyuide/utilities/constants.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  const InputField(

                    hintText: '    User Name',
                    icon: Icons.person,
                    invisible: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const InputField(
                      hintText: '    Password', icon: Icons.lock, invisible: true),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: RightText(),
            ),
            Expanded(
              flex: 1,
              child: wideActionButton(hint: 'Log in'),
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
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}