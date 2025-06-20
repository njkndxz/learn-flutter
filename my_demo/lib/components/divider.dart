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
        // ----------------------Divider的使用--------------------------
        body: Column(
          children: const [
            SizedBox(height: 20),
            Text("默认的分隔线"),
            Divider(),

            Text("灰色的分隔线"),
            Divider(color: Colors.grey),

            Text("红色的分隔线"),
            Divider(color: Colors.red,),

            Text("灰色高度为2的分隔线"),
            Divider(color: Colors.grey, thickness: 2),

            Text("设置了区域高度的分隔线"),
            Divider(color: Colors.grey, height: 100, thickness: 2),

            Text("前后缩进的分隔线"),
            Divider(color: Colors.grey, indent: 20, endIndent: 20, thickness: 2),
          ],
        ));
  }
}