import 'package:egyuide/utilities/components.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        const InputField(
                          hintText: 'Email',
                          icon: Icons.email,
                          invisible: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const InputField(
                            hintText: 'User Name',
                            icon: Icons.person,
                            invisible: false),
                        SizedBox(
                          height: 20,
                        ),
                        const InputField(
                            hintText: 'Password',
                            icon: Icons.lock,
                            invisible: true),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: wideActionButton(
                      hint: "Sign Up",
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
                        bottomConstantText(text: "Already have an account ?"),
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
    );
  }
}
