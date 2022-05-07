import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peahs_frontend/const/method.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
import 'package:peahs_frontend/state/main_state_controller.dart';

class CreateAccountPageController extends GetxController {
  final MainStateController _mCtrl = Get.find();
  // controller
  TextEditingController phoneNumber = TextEditingController();
  ScrollController scrollController = ScrollController();
  // const variable 
  List<Color> buttomColor = [
    PeahTheme.continueWait, PeahTheme.continueReady
  ];
  List<Color> progressColor = [
    const Color.fromRGBO(255, 0, 0, 1), 
    const Color.fromRGBO(252, 255, 106, 1), 
    const Color.fromRGBO(0, 221, 9, 1), 
  ];
  // reactive variable
    RxInt colorIndex = 0.obs;
    RxString errorMsg = ''.obs;

  @override
  void onInit() {
    phoneNumber.addListener( watch );
    super.onInit();
  }
  void watch(){
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    // validate
    if(satisfyLength(phoneNumber.text)&&satisfyPhone(phoneNumber.text)){
      colorIndex(1);
      errorMsg('');
    }else{
      colorIndex(0);
      errorMsg('Please enter valid number.');
    }
  }
  bool satisfyLength(String phone) => phone.length>7;
  bool satisfyPhone(String phone)=> (phone.startsWith('+959')||phone.startsWith('09'));
  
  void createAccount(){
    if(colorIndex.value==1){
      
    }else{
      errorMsg('invalid form data.');
    }
  }
  void haveAccount(){
    Method.log.e('i have account');
  }
}