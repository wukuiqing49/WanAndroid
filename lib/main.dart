import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get/GetRouter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _GetAppState();
}

class _GetAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    // SpUtils.set("isLogin", true);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "这是测试",
      theme: ThemeData(
        backgroundColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //1.配置路由
      initialRoute: "/",
      getPages: GetRouter.pages,
      defaultTransition:GetRouter.transition ,
    );
  }
}

