import 'package:dio/dio.dart';
import 'package:peahs_frontend/network/model/auth/register/from_register.dart';
import 'package:peahs_frontend/network/model/auth/register/to_register.dart';
import 'package:peahs_frontend/network/service/api_service.dart';
import 'package:peahs_frontend/view/page/auth/registerPage.dart';

class UserRegister {
  String username;
  String phone;
  String password;
  UserRegister({required this.username, required this.phone, required this.password});
  
  Future<FromRegister> register(){
    return ApiService(Dio()).register(
      ToRegister(username: username, phone: phone, password: password)
    )
    // .onError((error, stackTrace){
    //   throw DioError(
    //     requestOptions: (error as DioError).requestOptions,
    //     error: error.error,
    //     response: error.response,
    //   );
    // })
    ;
  }
}