import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyGetArgumentsPage extends StatefulWidget {
  const MyGetArgumentsPage({Key? key}) : super(key: key);

  @override
  State<MyGetArgumentsPage> createState() => _MyGetArgumentsPageState();
}

class _MyGetArgumentsPageState extends State<MyGetArgumentsPage> {
  late String title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title= Get.arguments["title"];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //返回结果
          Get.back(result: "11111");
        },
      child: const Icon(Icons.back_hand_outlined),),
      appBar: AppBar(
        title: Text("Get路由传递参数"),
        centerTitle: true,
      ),
      body: Center(child: Text(title),),
    );
  }
}
