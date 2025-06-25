import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageView")),
      // --------PageView
      body: PageView(
        scrollDirection: Axis.vertical, // 滑动方向为垂直方向
        children: <Widget>[
          // 页面1
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          // 页面2
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Page 2',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          // 页面3
          Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                'Page 3',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageviewBuilder extends StatefulWidget {
  const PageviewBuilder({super.key});

  @override
  State<PageviewBuilder> createState() => _PageviewBuilderState();
}

class _PageviewBuilderState extends State<PageviewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView Builder"),
      ),
      // --------使用 PageView.builder 创建PageView
      body: PageView.builder(
        itemCount: 10,    // 创建item的个数
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text('Page ${index + 1}', style: TextStyle(fontSize: 40))
          );
      }),
    );
  }
}
