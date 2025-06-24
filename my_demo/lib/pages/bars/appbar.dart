import 'package:flutter/material.dart';

class AppbarPage extends StatefulWidget {
  const AppbarPage({super.key});

  @override
  State<AppbarPage> createState() => _AppbarPageState();
}

// 1.首先需要混入SingleTickerProviderStateMixin
class _AppbarPageState extends State<AppbarPage>
    with SingleTickerProviderStateMixin {
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
        title: const Text('AppBar Demo'), // 标题
        centerTitle: true, // 标题居中
        backgroundColor: Colors.red, // 背景颜色
        leading: IconButton(
          // 左侧按钮
          icon: const Icon(Icons.search),
          onPressed: () {
            print('点击左侧按钮');
          },
        ),
        actions: [
          // 右侧按钮，可以有多个
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('点击了搜索按钮');
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              print('点击了更多按钮');
            },
          ),
        ],
        // 4.通过AppBar的bottom设置TabBar
        bottom: TabBar(
          controller: _tabController, // 设置tabController
          indicatorColor: Colors.white, // 设置指示器的颜色
          indicatorWeight: 4, // 设置指示器的高度
          labelColor: Colors.white, // 标签的文字颜色
          indicatorPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5), // 设置指示器的边距
          indicatorSize: TabBarIndicatorSize.label, // 设置指示器的宽度和标签一一样宽
          tabs: const [
            // 设置tabbar的各个标签
            // 设置tabbar的各个标签
            Tab(child: Text("关注")),
            Tab(child: Text("推荐")),
            Tab(child: Text("热榜")),
            Tab(child: Text("发现")),
            Tab(child: Text("视频")),
          ],
        ),
      ),
      // 5.设置TabBarView
      body: TabBarView(
        controller: _tabController, // 设置tabController
        children: const [
          // 当切换tabbar的标签时，会切换TabBarView中的各个组件
          Center(child: Text("关注")),
          Center(child: Text("推荐")),
          Center(child: Text("热榜")),
          Center(child: Text("发现")),
          Center(child: Text("视频")),
        ],
      ),
    );
  }
}
