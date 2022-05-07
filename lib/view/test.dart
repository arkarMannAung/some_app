import 'package:flutter/material.dart';
import 'package:peahs_frontend/const/peah_theme.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI/UX Viewer'),centerTitle: true,),
      body: Column(children: [
        Row(children: [Text('View Page',style: PeahTheme.textStyle(fontSize: 25.0),)],mainAxisAlignment: MainAxisAlignment.center,),
        const SizedBox(),
        Padding(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
          child: Column(children: [
            Row(children: [
              const Text("'/register' : Register Page",style: TextStyle(fontSize: 15.0),),
              const SizedBox(width: 30.0,),
              ElevatedButton(onPressed: ()=> Get.toNamed("/register"), child: const Text('view'))
            ],),
            const SizedBox(height: 20.0,),
            Row(children: [
              const Text("'/create-account' : Create Account Page",style: TextStyle(fontSize: 15.0),),
              const SizedBox(width: 30.0,),
              ElevatedButton(onPressed: ()=> Get.toNamed("/create-account"), child: const Text('view'))
            ],),
            const SizedBox(height: 30.0,),
          ],crossAxisAlignment: CrossAxisAlignment.start,),
        )
      ],mainAxisAlignment: MainAxisAlignment.center,)
    );
  }
}