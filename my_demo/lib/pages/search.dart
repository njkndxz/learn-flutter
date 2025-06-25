import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.content, this.arguments});

  final String content;
  final Map? arguments;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索'),
        leading: IconButton(
          onPressed: () {
            // ----- 返回到上一个页面
            Navigator.pop(context);
          },
          icon: Icon(Icons.back_hand),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // ----- 命名路由跳转，跳转到search页面, 传递参数
                Navigator.pushNamed(
                  context,
                  '/home',
                  arguments: {"content": "你好，逗比"},
                );
              },
              child: const Text("跳转到Home"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // ----- 替换路由, 替换到message页面
                Navigator.pushReplacementNamed(context, '/message');
              },
              child: const Text('跳转到message'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                /* 
                  使用 Navigator.pushNamedAndRemoveUntil() 方法，它用于实现页面导航并清除导航栈中的页面，以达到指定条件的效果。具体而言，它的作用如下：
                  首先，它会压入（导航到）一个新的命名路由页面到导航栈。
                  压入新页面之前，它会从导航栈中删除所有指定条件之前的页面，以确保只剩下符合条件的页面
                 */
                // 第三个参数是一个回调函数，始终返回false，表示一直删除，删除所有页面, 当返回 true 时，删除停止，页面保留在导航栈中
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/a', // 返回到/a页面
                  ModalRoute.withName('/'), // 删除中间的页面，直到根页面
                );
              },
              child: const Text('跳转到根路由'),
            ),
          ],
        ),
      ),
    );
  }
}
