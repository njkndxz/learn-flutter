import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// App根Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColumnDemo(),
    );
  }
}


class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});



  /* 
    我们Container的高度是400，宽度是 double.infinity 。 
    double.infinity 是为了让Container能填满整个屏幕，如果想让Container填满父元素，
    可以设置Container的宽度和高度的值尽可能的大，可以使用 double.infinity 或 double.maxFinite。
    然后在 Column 中添加了三个自定义的按钮，
    同时设置主轴的对齐方式为 MainAxisAlignment.spaceBetween（在子组件之间均匀分布，不包括首尾）。
    设置交叉轴的对齐方式为 CrossAxisAlignment.center（居中对齐）
   */
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 400,
            width: double.infinity,
            color: Colors.yellow,
            child: Column(
              // ---------------------在Column中添加三个按钮，按钮是自定义的组件------------------------
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                IconButton(icon: Icons.shop, color: Colors.lightBlue),
                IconButton(icon: Icons.house, color: Colors.lightGreen),
                IconButton(icon: Icons.fire_truck, color: Colors.red),
              ],
            ),
        );
  }
}

// 自定义一个按钮组件
class IconButton extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;

  // 自定义按钮组件，可以传递按钮的颜色和按钮上的图标，以及图标的尺寸
  const IconButton({super.key, required this.icon, this.color = Colors.blue, this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: color,
      child: Center(
          child: Icon(icon, size: size, color: Colors.white)
      ),
    );
  }
}