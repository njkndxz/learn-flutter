import 'package:flutter/material.dart';

class IconDemo extends StatelessWidget {
  const IconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: const Center(
        child: Icon(
            Icons.home,
            size: 60,   // 图标尺寸
            color: Colors.blue    // 图标颜色
        )
      ),
    );
  }
}
