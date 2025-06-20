import 'package:flutter/material.dart';

class SizedboxDemo extends StatelessWidget {
  const SizedboxDemo({super.key});

  /* 
  如果只是设置尺寸，不涉及额外的装饰和样式，优先使用 SizedBox 因为 Container 会增加一些性能开销。
  如果要使用样式，那么只能使用 Container 。 
  */
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Text('hello hello hello hello泥踏马!'),
    );
  }
}
