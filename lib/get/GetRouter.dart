import 'package:get/get.dart';
import 'package:wanandroid/pages/tabs/Tabs.dart';


import '../pages/NetPage.dart';
import 'MyGetArgumentsPage.dart';
import 'MyGetMiddleware.dart';


class GetRouter{
  static var transition= Transition.rightToLeftWithFade;
  static var pages=[
    GetPage(name: "/", page: ()=>Tabs(index: 0,)),
    GetPage(name: "/NetPage", page: ()=>NetPage()),
    // GetPage(name: "/MyGetPage", page: ()=> const MyGetPage(),middlewares: [MyGetMiddleware()]),

  ];
}