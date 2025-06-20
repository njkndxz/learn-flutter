import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// App根Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

/// 页面
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  /* 
    Wrap 是一个用于流式布局的组件，它可以将一系列子组件在水平或垂直方向上自动换行排列，适用于需要根据可用空间动态调整布局的情况。
    Wrap 可以在超出容器边界时自动将子组件放置到下一行或下一列，以适应不同尺寸的屏幕或容器。
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("热门搜索"),
          const Divider(color: Colors.grey),
          // --------------- Wrap的使用 -------------------
          Wrap(
            alignment: WrapAlignment.spaceEvenly, // 控制子组件的对齐方式
            spacing: 10, // 子组件之间的间距
            runSpacing: 0, // 行之间的间距
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "曹操",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "刘玄德",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "关羽",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "张飞",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "诸葛孔明",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "夏侯惇",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "司马老贼",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "孙权",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "孙策",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "孙尚香",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "典韦",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "赵云",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "吕布",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "马超",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
