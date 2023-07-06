import 'package:flutter/material.dart';

class DropD extends StatefulWidget {
  const DropD({Key? key}) : super(key: key);

  @override
  State<DropD> createState() => _DropDState();
}

class _DropDState extends State<DropD> {
  var language;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.language,
          color: Color(0xFF0E7886),
        ),
        labelText: "Select Language",
        labelStyle: TextStyle(
          color: Color(0xFF0E7886),
        ),
      ),
      dropdownColor: Colors.white,
      icon: Icon(
        Icons.arrow_drop_down_circle,
        color: Color(0xFF0E7886),
      ),
      items: ["Arabic", "English"]
          .map((e) => DropdownMenuItem(
                child: Text(
                  "$e",
                  style: TextStyle(
                    color: Color(0xFF0E7886),
                  ),
                ),
                value: e,
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          language = val;
        });
      },
      value: language,
    );
  }
}
