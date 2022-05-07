import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  String text;
  VoidCallback callback;
  TextStyle textStyle;
  Color primary;
  ActionButton({
    Key? key,
    required this.text,
    required this.callback,
    required this.textStyle,
    required this.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  )
              ),
              onPressed: callback,
              child: Text('Register',style: textStyle,),
            ),
          ),
        ),
      ],
    );
  }
}