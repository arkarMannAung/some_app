import 'package:get/get_navigation/get_navigation.dart';
import 'package:peahs_frontend/view/page/auth/createAccountPage.dart';
import 'package:peahs_frontend/view/page/auth/loginPage.dart';
import 'package:peahs_frontend/view/page/auth/otpPage.dart';
import 'package:peahs_frontend/view/page/auth/registerPage.dart';
import 'package:peahs_frontend/view/test.dart';

List<GetPage> routes = [
  GetPage(name: '/',page: ()=> RegisterPage()),
  GetPage(name: '/test',page: ()=> const Test() ),
  GetPage(name: '/login',page: ()=> const LoginPage() ),
  GetPage(name: '/register',page: ()=> RegisterPage() ),
  GetPage(name: '/create-account',page: ()=> CreateAccountPage() ),
  GetPage(name: '/otp-verify',page: ()=> const OtpPage() ),
];