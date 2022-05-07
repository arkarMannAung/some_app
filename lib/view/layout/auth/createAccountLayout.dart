import 'package:flutter/material.dart';
import 'package:peahs_frontend/const/peah_theme.dart';

// ignore: must_be_immutable
class CreateAccountLayout extends StatelessWidget {
  Widget phoneNumber;
  Widget callBack;
  ScrollController scrollController;
  Widget erroMsg;
  VoidCallback haveAccount;
  CreateAccountLayout({
    required this.phoneNumber,
    required this.callBack,
    required this.scrollController,
    required this.erroMsg,
    required this.haveAccount,
    Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SafeArea(
          child: ListView(controller: scrollController,children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 25.0),
              child: Image.asset('asset/images/create-account.png'),
            ),
            Text('Create your account',style: PeahTheme.textStyle(fontSize: 30.0),textAlign: TextAlign.center,),
            const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: phoneNumber
            ),
            erroMsg,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: callBack
            ),          
            const SizedBox(height: 20.0,),
            InkWell(
              onTap: haveAccount,
              child: Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      text: 'Log in.',
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

            const SizedBox(height: 100.0,),
          ],)
        ),
      ),
    );
  }
}