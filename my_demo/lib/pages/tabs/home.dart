import 'package:flutter/material.dart';

/// 主页tab页面
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  // 2.定义TabController
  late TabController _tabController;

  // 生命周期函数，当组件初始化的时候会被调用
  @override
  void initState() {
    super.initState();

    // 3.初始化TabController，其中第一个参数表示的tabbar的个数
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      // 监听当前选中的哪个标签页
      if (_tabController.animation!.value == _tabController.index) {
        print("选中标签页:${_tabController.index}"); //获取点击或滑动页面的索引值
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          bottom: TabBar(
            controller: _tabController,   // 设置tabController
            tabs: const [                 // 设置tabbar的各个标签
              Tab(child: Text("关注")),
              Tab(child: Text("推荐")),
              Tab(child: Text("热榜")),
              Tab(child: Text("发现")),
              Tab(child: Text("视频"))
            ],
          ),
        ),
        // 5.设置TabBarView
        body: TabBarView(
          controller: _tabController,     // 设置tabController
          children: const [               // 当切换tabbar的标签时，会切换TabBarView中的各个组件
            Center(child: Text("关注")),
            Center(child: Text("推荐")),
            Center(child: Text("热榜")),
            Center(child: Text("发现")),
            Center(child: Text("视频"))
          ],
        ));
  }
}