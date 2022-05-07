// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class RegisterLayout extends StatelessWidget {
  Text title;
  Widget phoneNumber;
  Widget userName;
  Widget password;
  Widget callBack;
  Widget validateInfo;
  ScrollController scrollController;
  RegisterLayout({
    required this.title,
    required this.phoneNumber,
    required this.userName,
    required this.password,
    required this.callBack,
    required this.validateInfo,
    required this.scrollController,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(controller: scrollController,children: [
              const SizedBox(height: 64.0,),
              title,
              const SizedBox(height: 30.0,),
              phoneNumber,
              const SizedBox(height: 23.0,),
              userName,
              const SizedBox(height: 23.0,),
              password,
              validateInfo,
              const SizedBox(height: 23.0,),
              callBack,
              const SizedBox(height: 50.0,),
            ]),
          ),
        ),
      ),
    );
  }
}