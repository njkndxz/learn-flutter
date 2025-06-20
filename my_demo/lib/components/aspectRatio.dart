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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Column(
        children: [
          // -------------使用AspectRatio，设置宽高比为3------------------
          AspectRatio(
            aspectRatio: 3,  //使用 AspectRatio 包裹 Container，设置宽高比为 3:1
            child: Container(
              color: Colors.lightBlue,
            )),
        ],
      )
    );
  }
}