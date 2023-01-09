import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/home_banner_info.dart';
import 'package:wanandroid/request/request_client.dart';

class NetPage extends StatefulWidget  {
  const NetPage({Key? key}) : super(key: key);

  @override
  State<NetPage> createState() => _NetPageState();
}

class _NetPageState extends State<NetPage>  {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //返回
        onPressed: () { Navigator.of(context).pop(context); },
        child: const Icon(Icons.home),
      ),
      appBar: AppBar(title: Text("数据请求"),centerTitle: true,),
      body: Container(child: Column(
        children:  <Widget>[
          ElevatedButton(onPressed: (){
            getType();


          }, child: const Text("Get请求")),
        ],
      ),),
    );;
  }
  CancelToken _cancelToken = CancelToken();


  void  getType()  async {

    List<HomeBannerInfo>? user = await requestClient.get<List<HomeBannerInfo>>("/banner/json",
        showLoading: false,
        onError: (e){
    return true;
    });
    print(user);


  }
  }



