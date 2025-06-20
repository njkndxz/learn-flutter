import 'package:flutter/material.dart';

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({super.key});

  /* 
  如果只是设置边距，不涉及额外的装饰和样式，优先使用 Padding 因为 Container 会增加一些性能开销。
  如果要使用样式，那么只能使用 Container 。 
  */
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Text('hello hello hello hello，wo泥踏马!', style: TextStyle(fontSize: 30),),
    );
  }
}
