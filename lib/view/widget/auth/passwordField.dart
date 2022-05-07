import 'package:flutter/material.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
// ignore: must_be_immutable
class PasswordField extends StatelessWidget {
  TextEditingController controller;
  bool obscureText;
  FocusNode focusNode;
  VoidCallback isShow;
  PasswordField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.focusNode,
    required this.isShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(      
        focusNode: focusNode,
        controller: controller,
        cursorColor: Colors.black,
        obscureText: obscureText,
        obscuringCharacter: '*',
        maxLength: 8,
        textAlignVertical: obscureText?TextAlignVertical.bottom:TextAlignVertical.center,
        style: PeahTheme.textStyle(fontSize: 18),
        decoration: InputDecoration(
          counterStyle: const TextStyle(height: double.minPositive,),
          counterText: "",
          suffix: InkWell(
            onTap: isShow,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              width: 50.0,
              alignment: Alignment.centerRight,
              child: Text(
                obscureText?'Show':'Hide',
                style: const TextStyle(fontSize: 15.0,color: Color.fromRGBO(0, 0, 0, 0.8)),),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.black
            )
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.black
            )
          ),
        )
      ),
    );
  }
}