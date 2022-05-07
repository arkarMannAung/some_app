import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatelessWidget {
  const OtpField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: TextEditingController(),
      autoDismissKeyboard: true,
      keyboardType: TextInputType.number,
      keyboardAppearance: Brightness.dark,
      appContext: context,
      length: 6,
      obscureText: true,
      // obscuringCharacter: '●',//⚫ ⬤
      obscuringCharacter: '⬤',
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          selectedColor: Colors.white,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(0),
          fieldHeight: 50, // from 35
          fieldWidth: 40,
          activeFillColor: const Color.fromRGBO(224, 224, 224, 1),
          selectedFillColor: const Color.fromRGBO(224, 224, 224, 1),
          inactiveFillColor: const Color.fromRGBO(224, 224, 224, 1),
          activeColor: const Color.fromRGBO(224, 224, 224, 1),
          inactiveColor: const Color.fromRGBO(224, 224, 224, 1)
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      cursorColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: (v) {
        // complete(v);
      },
      onChanged: (value) {},
    );
  }
}