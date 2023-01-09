import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tools/SpUtils.dart';

/// 中间件 拦截路由操作
class MyGetMiddleware extends GetMiddleware{
  // 路由拦截
  @override
  RouteSettings? redirect(String? route) {
    var isLogin=  SpUtils.getBool("isLogin") as bool;
    print(route);
    print("数据:${isLogin}");
    if(isLogin){
      return super.redirect(route);
    }else{
      return const RouteSettings(name: "/LoginPage",arguments: {});
    }
  }
}