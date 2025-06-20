import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// App根Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoCountPage(),
    );
  }
}

/// 页面
class DemoCountPage extends StatelessWidget {
  const DemoCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      // ------------------使用GridView.count创建GridView--------------------
      /* 
          通过 GridView.count 创建了 GridView ，并在 GridView 中添加了很多的自定义按钮，并通过 crossAxisCount 设置每一行元素的个数。
         */
      body: GridView.count(
        crossAxisCount: 3, // 设置每一行元素的个数，元素本身设置的宽高会失效
        scrollDirection: Axis.vertical, // 设置主轴的方向
        padding: const EdgeInsets.all(10), // 设置GridView的内边距
        mainAxisSpacing: 20, // 设置主轴的间距，这里是垂直间距
        crossAxisSpacing: 10, // 设置交叉轴的间距，这里是水平间距
        childAspectRatio: 1.2, // 设置宽高比例，宽度是高度的1.2倍
        children: const [
          IconButton(icon: Icons.shop, color: Colors.lightBlue),
          IconButton(icon: Icons.house, color: Colors.lightGreen),
          IconButton(icon: Icons.fire_truck, color: Colors.red),
          IconButton(icon: Icons.settings, color: Colors.orange),
          IconButton(icon: Icons.logout, color: Colors.cyan),
          IconButton(icon: Icons.star, color: Colors.yellow),
          IconButton(icon: Icons.delete, color: Colors.lightGreen),
          IconButton(icon: Icons.rule, color: Colors.lightBlue),
          IconButton(icon: Icons.timeline, color: Colors.lightGreen),
          IconButton(icon: Icons.access_alarm, color: Colors.lightBlue),
        ],
      ),
    );
  }
}

/// 页面
class DemoExtentPage extends StatelessWidget {
  const DemoExtentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      // ------------------使用GridView.extent创建GridView--------------------
      /* 
          通过 maxCrossAxisExtent 设置每个元素的最大宽度不会超过120，然后在这个约束条件下，尽可能多的在每一行显示子元素。
         */
      body: GridView.extent(
        maxCrossAxisExtent: 120, // 元素最大宽度不会超过120
        children: const [
          IconButton(icon: Icons.shop, color: Colors.lightBlue),
          IconButton(icon: Icons.house, color: Colors.lightGreen),
          IconButton(icon: Icons.fire_truck, color: Colors.red),
          IconButton(icon: Icons.settings, color: Colors.orange),
          IconButton(icon: Icons.logout, color: Colors.cyan),
          IconButton(icon: Icons.star, color: Colors.yellow),
          IconButton(icon: Icons.delete, color: Colors.lightGreen),
          IconButton(icon: Icons.rule, color: Colors.lightBlue),
          IconButton(icon: Icons.timeline, color: Colors.lightGreen),
          IconButton(icon: Icons.access_alarm, color: Colors.lightBlue),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> dataList = [
  {"text": "0", "color": 0xffff0000},
  {"text": "1", "color": 0xff00ff00},
  {"text": "2", "color": 0xff0000ff},
  {"text": "3", "color": 0xffffff00},
  {"text": "4", "color": 0xffff00ff},
  {"text": "5", "color": 0xff00ffff},
  {"text": "6", "color": 0xfff0f088},
  {"text": "7", "color": 0xfff088f0},
  {"text": "8", "color": 0xff00f0f0},
  {"text": "9", "color": 0xffcccccc},
];

/// 页面
class DemoBuilderPage extends StatelessWidget {
  const DemoBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      // ------------------使用GridView.builder创建GridView--------------------
      /* 
          我们首先创建了自定义的 Item 组件，接收文本和背景颜色，用于 GridView 的构建。
          在构建 GridView 的时候，使用 GridView.builder 来构建，itemCount 参数表示 Item 的个数，根据集合的长度来构建。
          gridDelegate 用于对 GridView 进行设置，和之前构建 GridVied 的参数类似，但是这里接收的数据类型是 SliverGridDelegateWithFixedCrossAxisCount，针对的是使用 crossAxisCount 参数构建 GridView 的情况，
          还有一种类型是 SliverGridDelegateWithMaxCrossAxisExtent，针对的是使用 参数来构建 GridView 的情况，可以根据需要选用指定的类型。
          itemBuilder 接收的是一个函数，返回的是 GridView 中的每个元素 Item ，函数的有两个参数，和之前构建 ListView 时候的参数是一样的，context 表示上下文对象，index 表示当前的序号，
          我们可以根据 index 在 dataList 中取数据，来构建和返回每一个 Item。
         */
      body: GridView.builder(
        itemCount: dataList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridItem(
            text: "${dataList[index]["text"]}",
            color: dataList[index]["color"],
          );
        },
      ),
    );
  }
}

// 自定义Item组件
class GridItem extends StatelessWidget {
  final String text;
  final int color;

  const GridItem({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(color),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

// 自定义一个按钮组件
class IconButton extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;

  const IconButton({
    super.key,
    required this.icon,
    this.color = Colors.blue,
    this.size = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: color,
      child: Center(
        child: Icon(icon, size: size, color: Colors.white),
      ),
    );
  }
}
