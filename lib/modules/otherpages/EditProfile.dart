import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Color(0xFF0E7886),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
            color: Color(0xFF0E7886),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image(
                        image: AssetImage("images/thom.jpg"),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color(0xFF0E7886),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              InputWidget(
                hintText: "Full Name",
                invisible: false,
              ),
              SizedBox(
                height: 15,
              ),
              InputWidget(
                hintText: "Email",
                invisible: false,
              ),
              SizedBox(
                height: 15,
              ),
              InputWidget(
                hintText: "Password",
                invisible: true,
              ),
              SizedBox(
                height: 15,
              ),
              InputWidget(
                hintText: "Location",
                invisible: false,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomButton(hint: "Save"),
                    SizedBox(
                      width: 30,
                    ),
                    BottomButton(hint: "Cancel"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget(
      {super.key, required this.hintText, required this.invisible});

  final String hintText;
  final bool invisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kInputFieldStyle,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          obscureText: invisible,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            hintText: hintText,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.hint});
  String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
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
