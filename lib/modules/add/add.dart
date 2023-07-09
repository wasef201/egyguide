import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/utilities/components.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

Color kBlue = Color(0xFF0E7886);

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  final title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is AddNewPostSuccess)
        {
          showMessage(message: 'تم النشر بنجاح!', state: ToastStates.success);
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: cubit.darkMode ? Color(0xff0E1D36) : Colors.white,
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: cubit.darkMode ? Color(0xff0E1D36) : Colors.white,
            leading: BackButton(
              color: cubit.darkMode ? sc : kBlue,
            ),
            title: Text(
              "اضافة ريلرز",
              style: TextStyle(
                color: cubit.darkMode ? sc : kBlue,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            actions: [
              if (state is! AddNewPostLoading)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: wideActionButton(
                        hint: "اضافة",
                        onPressed: () {
                          int cat_id = itemsCategoryIndex[itemsCategory.indexOf(cubit.selectedCatItem ?? 'Gym')];
                          int state_id = itemsStateIndex[itemsState.indexOf(cubit.selectedStateItem ?? 'Dakahlia')];
                          cubit.addNewPost(title: title.text, media: cubit!.finalImage ?? XFile('path'), cat_id: cat_id, state_id: state_id).then((value) {title.clear();});
                        }),
                  ),
                ),
              if (state is AddNewPostLoading)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Color(0xFFFF757C),
                  )),
                ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage("assets/imges/p2.webp"),
                            ),
                          ),
                          title: Text(
                            "${username}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: WhiteInputField(
                          hintText: "اضف عنوان",
                          controller: title,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      if (cubit.image == null && cubit.finalImage == null)
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () async {
                              print("### Image Before Pick");
                              print(cubit.image?.path.toString());
                              await cubit.pickFile();
                            },
                            child: DottedBorder(
                              radius: Radius.circular(12),
                              borderType: BorderType.RRect,
                              color: Colors.grey,
                              child: Container(
                                child: Center(
                                  child: DottedBorder(
                                    radius: Radius.circular(12),
                                    borderType: BorderType.RRect,
                                    color: Colors.grey,
                                    child: Padding(
                                      padding: EdgeInsets.all(30),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload_rounded,
                                            color: Color(0xFF0E7886),
                                          ),
                                          Text(
                                            "ارفع هنا",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 24,
                                                color: Color(0xFF0E7886)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (cubit.image != null || cubit.finalImage != null)
                        Expanded(
                          flex: 5,
                          child: Image.file(File(cubit.finalImage!.path)),
                        ),
                      SizedBox(height: 15),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text(
                                "الفئة",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: DropdownButton<String>(
                                items: itemsCategory
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item),
                                        )).toList(),
                                onChanged: (value) {
                                  cubit.selectCatItemChange(item: value.toString());
                                },
                                value: cubit.selectedCatItem ??= itemsCategory.first,
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "المحافظة",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(12),
                                items: itemsState
                                    .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                )).toList(),
                                onChanged: (value) {
                                  cubit.selectStateItemChange(item: value.toString());
                                },
                                value: cubit.selectedStateItem ??= itemsState.first,
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "الدولة",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Text(
                                "مصر          ",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
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
      },
    );
  }
}
