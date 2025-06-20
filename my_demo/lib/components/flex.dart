import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// App根Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlexDemo(),
    );
  }
}

class FlexDemo extends StatelessWidget {
  const FlexDemo({super.key});

  /* 
  如果只是设置尺寸，不涉及额外的装饰和样式，优先使用 SizedBox 因为 Container 会增加一些性能开销。
  如果要使用样式，那么只能使用 Container 。 
  */
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: const [
        // -------------------- 通过Expanded组件指定占用的比例 ----------------------
        Expanded(
          flex: 2, // 占用2份的空间，设置flex后，child的元素的宽度是失效的。
          child: IconButton(icon: Icons.shop, color: Colors.lightBlue),
        ),
        Expanded(
          flex: 1, // 占用1份的空间
          child: IconButton(icon: Icons.fire_truck, color: Colors.red),
        ),
      ],
    );
  }
}

// 自定义一个按钮组件
class IconButton extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;

  // 自定义按钮组件，可以传递按钮的颜色和按钮上的图标，以及图标的尺寸
  const IconButton({
    super.key,
    required this.icon,
    this.color = Colors.blue,
    this.size = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: color,
      child: Center(
        child: Icon(icon, size: size, color: Colors.white),
      ),
    );
  }
}
