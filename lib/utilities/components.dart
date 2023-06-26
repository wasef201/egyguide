import 'package:egyuide/modules/user/ForgetPassword.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class KtopLogo extends StatelessWidget {
  const KtopLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/imges/EgyGuide.png'),
    );
  }
}

class topBoldText extends StatelessWidget {
  topBoldText({required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: kTopBoldTextStyle,
    );
  }
}

class topGreyText extends StatelessWidget {
  topGreyText({required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: kTopGreyTextStyle,
    );
  }
}

class bottomConstantText extends StatelessWidget {
  bottomConstantText({required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w200,
        color: Colors.grey,
      ),
    );
  }
}

class socialLink extends StatelessWidget {
  socialLink({required this.text, required this.icon});

  String text;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.grey,
      child: ListTile(
        leading: this.icon,
        title: Text(text),
      ),
    );
  }
}

class socialLinkWithImage extends StatelessWidget {
  socialLinkWithImage({required this.text, required this.image});

  String text;
  AssetImage image;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.grey,
      child: ListTile(
        leading: Image(
          image: image,
        ),
        title: Text(text),
      ),
    );
  }
}

class Seperator extends StatelessWidget {
  const Seperator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.grey,
              height: 36,
              thickness: 1,
            )),
      ),
      Text("OR"),
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.grey,
              height: 36,
              thickness: 1,
            )),
      ),
    ]);
  }
}

class wideActionButton extends StatelessWidget {
  wideActionButton({required this.hint});
  String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFF757C),
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

class RightText extends StatelessWidget {
  const RightText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgetPassword()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(right: 25),
        child: Text(
          'Forget password ?',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: kGreyText,
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.invisible});

  final String hintText;
  final IconData icon;
  final bool invisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kInputFieldStyle,
      height: 60.0,
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
          prefixIcon: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xF000000),
                  blurRadius: 50.0,
                  offset: Offset(0, 2),
                  spreadRadius: -1
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,

              child: Icon(
                icon,
                color: kPink,
              ),
            ),
          ),
          hintText: hintText,
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}

class redircetText extends StatelessWidget {
  redircetText({required this.text, required this.onPressed});
  String text;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w200,
          color: Color(0xFFFF757C),
        ),
      ),
    );
  }
}
class WhiteInputField extends StatelessWidget {
  const WhiteInputField({Key? key, required this.hintText}) : super(key: key);

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 60,
      decoration: kWhiteInputFieldStyle,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.grey,
          fontFamily: 'cairo',
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGreen, width: 2.0),
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsetsDirectional.only(top: 14.0, start: 18),
          hintText: hintText,
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
