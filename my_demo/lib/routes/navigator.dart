import 'package:flutter/material.dart';
import 'package:my_demo/pages/search.dart';


class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // 点击按钮，跳转到search页面
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SearchPage(content: '来自跳转的搜索');
              },
            ),
          );
        },
        child: const Text('跳转到Home'),
      ),
    );
  }
}
