import 'package:flutter/material.dart';

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

  /* 
    我们在 Container 组件中放了一个 Stack 组件，
    然后在Stack组件中放了三个子组件（Container、Icon、Text），通过效果可以看出三个子组件叠加到一起了。
    如果Stack没有外部容器，则相对于页面进行定位的。
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: Container(
        width: double.infinity,
        height: 400,
        color: Colors.grey,
        child: Stack(
          children: [
            Container(width: 200, height: 200, color: Colors.lightBlue),
            const Icon(Icons.access_alarm),
            const Text("Hello World"),
          ],
        ),
      ),
    );
  }
}

/// 页面
class PositionedPage extends StatelessWidget {
  const PositionedPage({super.key});

  /* 
    我们在 Container 组件中放了一个 Stack 组件，
    然后在Stack组件中放了三个子组件（Container、Icon、Text），通过效果可以看出三个子组件叠加到一起了。
    如果Stack没有外部容器，则相对于页面进行定位的。
   */
  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: Container(
        width: double.infinity,
        height: 400,
        color: Colors.grey,
        child: Stack(
          children: [
            Positioned( // 使用Positioned控制位置
              left: 0,
              right: 0,
              bottom: 0,
              width: screenWidth,   // 设置和屏幕一样宽，这里不能使用double.infinity
              height: 100,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.lightBlue,
              ),
            ),
            Positioned(right: 0, child: Icon(Icons.access_alarm)),
            Positioned(right: 0, top: 200, child: const Text("Hello World")),
          ],
        ),
      ),
    );
  }
}

/// 页面
class AlignPage extends StatelessWidget {
  const AlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: SizedBox(
            width: double.infinity,
            height: 40,
            
            // -------------------Stack 和 Align--------------------------
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("取消"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("确定"),
                ),
              ],
            ),
          )
    );
  }
}
