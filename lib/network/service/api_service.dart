import 'package:peahs_frontend/network/model/auth/register/from_register.dart';
import 'package:peahs_frontend/network/model/auth/register/to_register.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://3c9a-116-206-137-47.ngrok.io/v1/user/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/register')
  Future<FromRegister> register(
    @Body() ToRegister toRegister
  );
}