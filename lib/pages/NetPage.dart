import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/models/api_response.dart';
import 'package:wanandroid/models/home_banner_info.dart';
import 'package:wanandroid/request/request_client.dart';

import '../generated/json/base/json_convert_content.dart';
import '../request/apis.dart';

class NetPage extends StatefulWidget {
  const NetPage({Key? key}) : super(key: key);

  @override
  State<NetPage> createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //返回
        onPressed: () {
          Navigator.of(context).pop(context);
        },
        child: const Icon(Icons.home),
      ),
      appBar: AppBar(
        title: Text("数据请求"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  getType();
                },
                child: const Text("Get请求")),
          ],
        ),
      ),
    );
  }

  void getType() async {
    var user = await requestClient.get(APIS.banner, showLoading: false, onError: (e) {
      return true;
    });
    print("数据:$user");
    // 列表数据转换
    List<HomeBannerInfo>? users =
        jsonConvert.convertListNotNull<HomeBannerInfo>(user);
    print("新数据:${users?.length}");
  }
}
