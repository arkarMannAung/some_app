import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
import 'package:peahs_frontend/view/controller/auth/createAccountPageController.dart';
import 'package:peahs_frontend/view/layout/auth/createAccountLayout.dart';
import 'package:peahs_frontend/view/widget/auth/inputField.dart';
import 'package:peahs_frontend/view/widget/auth/actionButton.dart';

class CreateAccountPage extends StatelessWidget {
  final _ctrl = Get.put(CreateAccountPageController());
  CreateAccountPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CreateAccountLayout(
      scrollController: _ctrl.scrollController,
      phoneNumber: Column(
        children: [
          Text('Phone Number*',style: PeahTheme.textStyle(fontSize: 18),),
          const SizedBox(height: 8.0,),
          InputField(
            controller: _ctrl.phoneNumber,
            textInputType: TextInputType.number,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      erroMsg: Obx( ()=> Padding(
        padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 20.0,top: _ctrl.errorMsg.isEmpty? 0.0 : 20.0),
        child: Text(_ctrl.errorMsg.value,style: PeahTheme.textStyle(color: Colors.red,fontSize: 16.0,fontStyle: FontStyle.italic),)
      ),),
      callBack: Obx(() => ActionButton(
        text: 'Continue',
        callback: (){},
        textStyle: PeahTheme.textStyle(fontSize: 23,color: Colors.white),
        primary: _ctrl.buttomColor[ _ctrl.colorIndex.value ],
      )),
      haveAccount: ()=>_ctrl.haveAccount(),
    );
  }
}