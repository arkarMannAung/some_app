import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:peahs_frontend/state/main_state_controller.dart';
import 'package:peahs_frontend/view/route.dart';
import 'package:get/get.dart';

void main() async{
  await GetStorage.init();
  Get.put(MainStateController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: routes,
      theme: ThemeData(fontFamily: 'Bellefair',backgroundColor: Colors.blue),
    )
  );
}