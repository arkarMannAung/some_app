import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:get_storage/get_storage.dart';

class MainStateController extends GetxController {
  final _box = GetStorage();
  Logger logger = Logger();
  // private Auth variable
    late bool _isRegister;
    late bool _isLogin;
    late String _token;
  // private Auth variable
  // font
  
  // font 
  // method for change state
  bool isRegister() => _isRegister;
  bool isLogin() => _isLogin;
  String token() => _token;
  void setToken({required String token}){
    _box.write('token', token);
    _token=token;
  }
  void setIsRegister({required bool isRegister}){
    _box.write('isRegister', isRegister);
    _isRegister=isRegister;
  }
  void setIsLogin({required bool isLogin}){
    _box.write('isLogin', isLogin);
    _isLogin=isLogin;
  }
  // method for change state
  @override
  void onInit() {  
    // init data from getStroage
    _isRegister = _box.read('isRegister')?? false;
    _isLogin = _box.read('isLogin')?? false;
    _token = _box.read('token')?? '';
    // init data from getStroage
    super.onInit();
  }

}