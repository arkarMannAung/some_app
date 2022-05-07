import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Method {
  static int intervel = 5000;
  static final Logger log = Logger();
  static Future sleep(int ms)=>Future.delayed(Duration(milliseconds: ms));
  static void snaker({required String title,required String message,Color colorText=Colors.blueAccent})=>Get.snackbar(
    title, message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: colorText,
    duration: const Duration(seconds: 5),
    margin: const EdgeInsets.only(bottom: 100.0,left: 10.0,right: 10.0)
  );
  
  static void apiError({required Object obj,String text='Error '}){
    String title='';
    String message='';
    if(obj.runtimeType==DioError){
      final err = (obj as DioError).response;
      title = text + err!.statusCode.toString();
      message = err.statusMessage.toString();
    }else{
      title=text;
      message='unknown error';
    }
    snaker(title: title, message: message);
  }
  // Loading
  static ScrollController controller = ScrollController();
  // static void load()=> Get.dialog(
  //   LoadingDialog(controller: controller),
  //   name: 'loading',
  // );
  static void close(){
    if(controller.hasClients){
      Get.back();
    }else{
      log.e('no Client');
    }
  }
  // Loading
}
