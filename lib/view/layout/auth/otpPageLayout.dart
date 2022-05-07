import 'package:flutter/material.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
import 'package:peahs_frontend/view/widget/auth/otpField.dart';

// ignore: must_be_immutable
class OtpPageLayout extends StatelessWidget {
  Widget actionCallBack;
  VoidCallback resendAgain;
  OtpPageLayout({
    required this.actionCallBack,
    required this.resendAgain,
    Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0,top: 70.0,right: 28.0),
          child: ListView(children: [
            Container(
              padding: const EdgeInsets.only(left: 88.0,right: 88.0),
              child: Image.asset('asset/images/otp.png',fit: BoxFit.cover,),
            ),
            const SizedBox(height: 47.0,),
            Text('Verification',style: PeahTheme.textStyle(fontSize: 25.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            const SizedBox(height: 23.0,),
            Text('You will receive a OTP via SMS',style: PeahTheme.textStyle(fontSize: 25.0),textAlign: TextAlign.center,),
            const SizedBox(height: 23.0,),
            OtpField(),
            const SizedBox(height: 5.0,),
            actionCallBack,
            const SizedBox(height: 26.0,),
            InkWell(
              onTap: resendAgain,
              child: Text.rich(
                TextSpan(
                  text: 'Didn’t get the code? ',
                  children: [
                    TextSpan(
                      text: 'Resend again.',
                      style: PeahTheme.textStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.underline
                      )
                    )
                  ]
                ),
                style: PeahTheme.textStyle(
                  fontSize: 20.0
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 27.0,),
            Text('Resend will be available in 00:00',style: PeahTheme.textStyle(fontSize: 18.0),textAlign: TextAlign.center,)

          ]),
        ),
      ),
    );
  }
}