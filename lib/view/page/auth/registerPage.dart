import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
import 'package:peahs_frontend/view/controller/auth/registerPageController.dart';
import 'package:peahs_frontend/view/layout/auth/registerLayout.dart';
import 'package:peahs_frontend/view/widget/auth/inputField.dart';
import 'package:peahs_frontend/view/widget/auth/passwordField.dart';
import 'package:peahs_frontend/view/widget/auth/actionButton.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({ Key? key }) : super(key: key);
  final RegisterPageController _rCtrl = Get.put(RegisterPageController());
  
  @override
  Widget build(BuildContext context) {
    return RegisterLayout(
      scrollController: _rCtrl.scrollController,
      title: Text(
        'Create your account',
        style: PeahTheme.textStyle(fontSize: 20.0)
      ),
      phoneNumber: Column(
        children: [
          Text('Phone Number*',style: PeahTheme.textStyle(fontSize: 18),),
          const SizedBox(height: 8.0,),
          InputField(
            controller: _rCtrl.phoneNumber,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      userName: Column(
        children: [
          Text('Username*',style: PeahTheme.textStyle(fontSize: 18),),
          const SizedBox(height: 8.0,),
          InputField(
            controller: _rCtrl.userName,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      password: Column(
        children: [
          Text('Password*',style: PeahTheme.textStyle(fontSize: 18),),
          const SizedBox(height: 8.0,),
          Obx( () => PasswordField(
            controller: _rCtrl.password,
            focusNode:  _rCtrl.focusNode,
            obscureText: _rCtrl.obscureText.isTrue,
            isShow: ()=> _rCtrl.obscureText(!_rCtrl.obscureText.isTrue)
          )

          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      validateInfo: Obx( ()=> Visibility(
        visible: _rCtrl.progress>0,
        child: Column(children: [
          const SizedBox(height: 8,),
          SizedBox(
            height: 6.0,
            child: ClipRRect(
              borderRadius: const  BorderRadius.all(Radius.circular(6)),
              child: LinearProgressIndicator(
                value: _rCtrl.progress.value,
                color: _rCtrl.progressColor[ _rCtrl.progressColorIndex.value ],
                backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            'Password quality: '+ _rCtrl.passwordQuality[ _rCtrl.progressColorIndex.value ],
            style: PeahTheme.textStyle(fontSize: 12),
          ),
          const SizedBox(height: 12,),
          Text(_rCtrl.errorMsg.value,style: PeahTheme.textStyle(fontSize: 20.0,color: Colors.red,fontStyle: FontStyle.italic),),
          const SizedBox(height: 11,),
          Text(
            'Tips for a strong password',
            style: PeahTheme.textStyle(fontSize: 16.0,fontWeight: FontWeight.w800),
          ),
          Text(
            'Don’t use a previous password',
            style: PeahTheme.textStyle(fontSize: 12),
          ),
          Text(
            'Don’t use your name or phone number in the password',
            style: PeahTheme.textStyle(fontSize: 12),
          ),
          Obx( ()=>
          Row(
            children: [
              Text(
                'Use 8 characters (6 characters minimum)',
                style: PeahTheme.textStyle(fontSize: 12),
              ),
              const SizedBox(width: 5.0,),
              _rCtrl.passwordLen.value==8?
              const Icon(Icons.check_circle,size: 12.0 ,color: Color.fromRGBO(0, 221, 9, 1),)
              :const Icon(Icons.error,size: 12.0,color: Color.fromRGBO(255, 0, 0, 1),)
            ],
          ),),
          Obx( ()=>
          Row(
            children: [
              Text(
                'Use a mix of numbers and symbols',
                style: PeahTheme.textStyle(fontSize: 12),
              ),
              const SizedBox(width: 5.0,),
              _rCtrl.bothNumberAndSpechialCha.isTrue?
              const Icon(Icons.check_circle,size: 12.0 ,color: Color.fromRGBO(0, 221, 9, 1),)
              :const Icon(Icons.error,size: 12.0,color: Color.fromRGBO(255, 0, 0, 1),)
            ],
          ),),
          const SizedBox(height: 4,),
        ],crossAxisAlignment: CrossAxisAlignment.start,),
      )),
      callBack: Obx( ()=> ActionButton(
        text: 'Register',
        callback: ()=> _rCtrl.register(),
        textStyle: PeahTheme.textStyle(fontSize: 23,color: Colors.white),
        primary: _rCtrl.buttomColor[ _rCtrl.colorIndex.value ],
      )),

    );
  }
}
