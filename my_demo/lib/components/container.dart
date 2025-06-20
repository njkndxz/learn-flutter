import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContainerDemo(),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Demo')),
      body: Center(
        // --------------------- 下面是Container的设置 -----------------------------
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center, // 设置容器内子元素显示方位，这里设置子元素居中
          padding: const EdgeInsets.all(20), // 设置内边距padding
          margin: const EdgeInsets.all(20), // 设置设置外边距margin
          decoration: BoxDecoration(
            color: Colors.blue, // 设置背景颜色
            borderRadius: BorderRadius.circular(10), // 设置圆角
            border: Border.all(color: Colors.black, width: 2), // 设置边框
            boxShadow: const [
              // 设置阴影
              BoxShadow(
                color: Colors.black,
                blurRadius: 20, // blurRadius设置的是阴影的模糊半径
                offset: Offset(4, 4), // 设置阴影的偏移量，往右下偏移
              ),
            ],
            gradient: const LinearGradient(
              // 设置背景渐变，会覆盖背景颜色，这里使用的是线性渐变
              colors: [
                Colors.blue, Colors.green, // 设置渐变颜色
              ],
            ),
          ),
          child: const Text(
            // 设置一个子元素
            '你好，逗比!',
            style: TextStyle(color: Colors.white), // 设置子元素样式
          ),
        ),
      ),
    );
  }
}
