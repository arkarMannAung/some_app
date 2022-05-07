import 'package:flutter/material.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
// ignore: must_be_immutable
class InputField extends StatelessWidget {
  TextEditingController controller;
  TextInputType textInputType;
  InputField({
    Key? key,
    required this.controller,
    this.textInputType=TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Colors.black,
      style: PeahTheme.textStyle(fontSize: 18),
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.black
          )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.black
          )
        ),
      )
    );
  }
}