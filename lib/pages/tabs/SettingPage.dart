import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';



class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _HomePageState();
}

class _HomePageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      ElevatedButton(onPressed: (){
       Get.toNamed("/MyGetPage");
      // Navigator.pushNamed(context, "/GetPage");
      }, child: Text("Get插件使用")),

      ElevatedButton(onPressed: (){
        Get.toNamed("/NetPage");
        // Navigator.pushNamed(context, "/GetPage");
      }, child: Text("网络请求"))
    ],),);
  }
}
