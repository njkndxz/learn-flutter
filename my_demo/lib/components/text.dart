import 'package:flutter/material.dart';

void main() => (const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextDemo(),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 40,
        alignment: Alignment.center,                  // 设置容器内子元素显示方位，这里设置子元素居中
        decoration: BoxDecoration(
          color: Colors.blue,                       // 设置背景颜色
          borderRadius: BorderRadius.circular(20),    // 设置圆角
        ),
        child: Text(  // 设置文本子元素
          'Hello World，I am coming',
          maxLines: 5, // 设置显示的最大行数
          textAlign: TextAlign.center, // 设置文字对齐的方式
          overflow: TextOverflow.ellipsis, // 设置文字超出时候的样式，ellipsis是显示为...
          style: TextStyle(
            color: Colors.blue, // 字体颜色
            fontSize: 30, // 字体大小
            fontWeight: FontWeight.bold, // 字体加粗
            letterSpacing: 1, // 设置字母间隙
            wordSpacing: 10, // 设置单词间隙
            decoration: TextDecoration.underline, // 设置文字修饰线为下划线样式
            decorationColor: Colors.red, // 设置文字修饰线的颜色
            decorationStyle: TextDecorationStyle.double, // 设置修饰线样式为double
          ), // 设置子元素样式
        ),
      ),
    );
  }
}
