import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peahs_frontend/const/method.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
import 'package:peahs_frontend/network/controller/auth/register/user_register.dart';
import 'package:dio/dio.dart';
import 'package:peahs_frontend/network/model/auth/register/from_register.dart';
import 'package:peahs_frontend/state/main_state_controller.dart';

class RegisterPageController extends GetxController {
  final MainStateController _mCtrl = Get.find();
  // controller
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  ScrollController scrollController = ScrollController();
  FocusNode focusNode = FocusNode();
  // const variable 
  List<Color> buttomColor = [
    PeahTheme.continueWait, PeahTheme.continueReady
  ];
  List<Color> progressColor = [
    const Color.fromRGBO(255, 0, 0, 1),
    const Color.fromRGBO(252, 255, 106, 1),
    const Color.fromRGBO(0, 221, 9, 1),
  ];
  List<String> passwordQuality = [
    'Low','Medium','Strong'
  ];
  // reactive variable
    RxInt passwordLen = 0.obs;
    RxInt colorIndex = 0.obs;
    RxBool obscureText = true.obs;
    RxBool bothNumberAndSpechialCha = false.obs;
    RxString errorMsg = ''.obs;
    // validateInfo
      RxInt progressColorIndex = 0.obs;
      RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    phoneNumber.addListener( watch );
    userName.addListener( watch );
    password.addListener( watch );
    // focusNode.addListener(() {
    //   if(focusNode.hasFocus){
    //     scrollController.jumpTo(scrollController.position.maxScrollExtent);
    //   }
    // });
    super.onInit();
  }
  void watch(){
    // validate
    if(phoneNumber.text!=''&&userName.text!=''&&password.text.length>5){
      colorIndex(1);
    }else{
      colorIndex(0);
    }
    // password quality
    if(password.text.length==8 && hasSpecialCharacters(password.text) && hasNumber(password.text)){
      progress(1.0);
      progressColorIndex(2);
    }else if(password.text.length>=7 && (hasSpecialCharacters(password.text) || hasNumber(password.text) )){
      progress(0.8);
      progressColorIndex(1);
    }else if(password.text.length<7){
      progress(password.text.length/10);
      progressColorIndex(0);
    }
    passwordLen(password.text.length);
    bothNumberAndSpechialCha(hasSpecialCharacters(password.text)&&hasNumber(password.text));
    if(focusNode.hasFocus){
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }
  // bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
  // bool hasDigits = password.contains(new RegExp(r'[0-9]'));
  // bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
  // bool hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasSpecialCharacters(String password) => password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasNumber(String password)=> password.contains(RegExp(r'[0-9]'));
  
  void register(){
    if(colorIndex.value==1){
      UserRegister reg = UserRegister(username: 'hello',phone: '+9591234567',password: 'retrofit');
      reg.register()
      .then((value) {
        errorMsg('');
        Method.log.i(value.message);
      })
      // ;
      .onError((error, stackTrace){
        var errorResponse = (error as DioError).response;
        if(errorResponse!= null && errorResponse.data.runtimeType!=String){
          final errorResponseData = FromRegister.fromJson(errorResponse.data);
          Method.snaker(title: 'Error', message: errorResponseData.message);
          errorMsg(errorResponseData.message);
          Method.log.i(errorResponseData.message);
        }else{
          errorMsg('Check Internet Connection');  
          Method.log.i('null');
        }
      });
    }else{
      errorMsg('invalid form data.');
    }
  }
}