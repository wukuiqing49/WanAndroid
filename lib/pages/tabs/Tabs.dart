import 'package:flutter/material.dart';
import 'package:wanandroid/pages/tabs/CategoryPage.dart';
import 'package:wanandroid/pages/tabs/PersonPage.dart';
import 'package:wanandroid/pages/tabs/SettingPage.dart';
import 'FindPage.dart';
import 'HomePage.dart';

class Tabs extends StatefulWidget {
  int index;
   Tabs({Key? key,this.index=0}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}


class _TabsState extends State<Tabs> {

  var bodyPages = const [
    HomePage(),
    CategoryPage(),
    FindPage(),
    SettingPage(),
    PersonPage()
  ];
  late var myIndex ;
  @override
  void initState() {

    super.initState();
     myIndex = widget.index;
  }

  // var bodyPages= const [ HomePage(), CategoryPage(),FindPage(),SettingPage(),PersonPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //设置 没有阴影
          elevation: 0.0,
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          //配置标题居中(所有的)
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            )
          ],
          title: const Text("标题"),
        ),
        body: bodyPages[myIndex],
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          width: 60,
          height: 60,
          padding: EdgeInsets.all(5),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                myIndex = 2;
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: myIndex,
            // fixedColor: Colors.green,// 选中的颜色
            backgroundColor: Colors.white,
            //背景颜色
            selectedItemColor: Colors.blue,
            // 选中的颜色  fixedColor和selectedItemColor只能存在一个
            unselectedItemColor: Colors.grey,
            //设置 点击效果 shifting 动画和标签在点击时淡出 fixed 固定宽度
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "我的"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "发现"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "设置"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "个人中心"),
            ]));
  }

}