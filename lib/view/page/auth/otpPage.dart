import 'package:flutter/material.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
import 'package:peahs_frontend/view/layout/auth/otpPageLayout.dart';
import 'package:peahs_frontend/view/widget/auth/actionButton.dart';
import 'package:peahs_frontend/view/widget/auth/otpField.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OtpPageLayout(
      actionCallBack: ActionButton(
        callback: (){
          print('verify');
        },
        text: 'Verify',
        textStyle: PeahTheme.textStyle(fontSize: 23,color: Colors.white),
        primary: Colors.grey // _rCtrl.buttomColor[ _rCtrl.colorIndex.value ],
      ),
      resendAgain: (){},
    );
  }
}
