import 'package:egyuide/modules/otherpages/EditProfile.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
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
                        "Set a new password ",
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
                      // Text(
                      //   "Enter your phone number. you will receive a code to create a new password ",
                      //   style: kHintTextStyle,
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    InputWidget(
                        hintText: "Enter previous password", invisible: true),
                    SizedBox(
                      height: 20,
                    ),
                    InputWidget(
                        hintText: "Enter new password", invisible: true),
                    SizedBox(
                      height: 20,
                    ),
                    InputWidget(
                        hintText: "Confirm new password", invisible: true),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 50, child: wideActionButton(hint: "confirm")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class wideActionButton extends StatelessWidget {
  wideActionButton({required this.hint});
  String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0E7886),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          hint,
          textAlign: TextAlign.center,
          style: kWideActionButtonStyle,
        ),
      ),
    );
  }
}
