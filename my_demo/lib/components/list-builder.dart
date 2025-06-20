import 'package:flutter/material.dart';
import 'package:my_demo/contants/new_lists.dart';

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
      appBar: AppBar(title: const Text('Demo')),
      //------------------ 构建动态ListView ---------------------
      body: ListView.builder(
        itemCount: newsList.length, // itemCount表示itemBuilder将会执行的次数
        itemBuilder: (context, index) {
          // itemBuilder函数用于Item
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                leading: Image.network(
                  newsList[index]['cover'] ?? '',
                  fit: BoxFit.cover,
                  width: 80,
                ),
                title: Text(
                  newsList[index]['title'] ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  newsList[index]['subtitle'] ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
