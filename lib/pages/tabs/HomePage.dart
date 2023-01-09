import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wanandroid/tools/KeepAliveWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// 1: with SingleTickerProviderStateMixin
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {
  late TabController tabController;
  var position = 0;

void getClass() async{




}

  void getBanner() async{

    // var lists=result.data as List<HomeBannerInfo>;
    // print(lists.length);

  }

  Widget _createTab(String tabStr){
    return Tab(text: tabStr,);
  }
  // 2: 创建 tabController
  late List<Widget> lists;
  @override
 void initState()   {
    super.initState();
    getClass();

    tabController = TabController(length: 8, vsync: this);
    //监听tab 点击和滑动位置
    tabController.addListener(() {
      //会获取两次要过滤一下
      if (tabController.animation!.value == tabController.index) {
        var position = tabController.index;
        print("位置:$position");
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        //控制 AppBar 的高度
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          //阴影高度
          elevation: 1,
          title: TabBar(
            //是否滑动 超出屏幕外要设置为true
            isScrollable: true,
            //指针大小  label 跟随文字大小  tab 跟随 控件宽度
            indicatorSize: TabBarIndicatorSize.label,
            //  3: 创建 绑定tabController
            controller: tabController,
            //tab 点击事件(无法监听滑动事件)
            onTap: (index) {},
            tabs: const [
              Tab(
                text: "关注",
              ),
              Tab(
                text: "关注",
              ),
              Tab(
                text: "关注",
              ),
              Tab(
                text: "关注",
              ),
              Tab(
                text: "关注",
              ),
              Tab(
                text: "关注",
              ),
              Tab(
                text: "关注",
              ),
              Tab(
                text: "关注",
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: TabBarView(
          // 4:  绑定tabController
          controller: tabController,
          children: [
            KeepAliveWrapper(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("头部"),
                    subtitle: Text("头部"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("标题"),
                    subtitle: Text("副标题"),
                  ),
                  ListTile(
                    title: Text("尾部"),
                    subtitle: Text("尾部"),
                  ),
                ],
              ),
              keepAlive: true,
            ),
            Text("2"),
            Text("3"),
            Text("4"),
            Text("5"),
            Text("6"),
            Text("7"),
            Text("8"),
          ],
        ),
      ),
    );
  }
}
