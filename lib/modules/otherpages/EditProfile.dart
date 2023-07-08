import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
                            image: AssetImage(cubit.userProfile.avatar),
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
                    type: 'username',
                    hintText: username ?? 'Unknown',
                    invisible: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InputWidget(
                    type: 'email',
                    hintText: email ?? 'unknown@unknow.unkown',
                    invisible: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InputWidget(
                    type: 'password',
                    hintText: "*****",
                    invisible: true,
                  ),
                  SizedBox(
                    height: 15,
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
                        InkWell(child: BottomButton(hint: "Cancel"),onTap: () => Navigator.of(context).pop(),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class InputWidget extends StatelessWidget {
  InputWidget(
      {super.key, required this.hintText, required this.invisible, required this.type});

  final String hintText;
  final String type;
  final bool invisible;
  var controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    controller.text = hintText;
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kInputFieldStyle,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          controller: controller,
          obscureText: invisible,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            labelText: type,
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
