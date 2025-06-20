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
    按钮都会带有一个 onPressed 回调函数，当点击按钮的时候会触发。
    如果不设置 onPressed 属性，按钮将是灰色的。
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      // ------------------Card------------------
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            // ---------------凸起按钮-------------------
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(20), // 添加阴影
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ), // 设置圆角
                ),
              ),
              child: const Text("凸起按钮"),
            ),

            // ---------------文字按钮-------------------
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  const CircleBorder(
                    // 设置为圆型按钮
                    // 设置为原型按钮
                    side: BorderSide(
                      color: Color(0x00000000), // 按钮默认是有边框的，这里设置为透明边框
                    ),
                  ),
                ),
              ),
              child: const Text("文字按钮"),
            ),

            // ---------------边框按钮------------------- 对
            //于边框按钮，通过 BorderSide 中的属性来设置边框的宽度和颜色是无效的。
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(
                  Colors.black,
                ), // 修改文字的颜色
                side: WidgetStateProperty.all(
                  const BorderSide(width: 2, color: Colors.blue),
                ), // 修改边框宽度和颜色
              ),
              child: const Text("圆形"),
            ),

            // ---------------图标按钮-------------------
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_box)),

            // 添加图标
            // //---------------凸起按钮-------------------
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.send, color: Colors.green),
            //   label: const Text(
            //     "发送",
            //     style: TextStyle(color: Colors.red, fontSize: 20),
            //   ), // 修改按钮字体颜色和大小
            //   style: ButtonStyle(
            //     backgroundColor: WidgetStateProperty.all(
            //       Colors.grey,
            //     ), // 修改按钮背景颜色
            //     foregroundColor: WidgetStateProperty.all(
            //       Colors.black,
            //     ), // 修改文字颜色，会被字体颜色覆盖
            //   ),
            // ),

            // // ---------------文字按钮-------------------
            // TextButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.delete, color: Colors.grey),
            //   label: const Text("删除"),
            // ),

            // // ---------------边框按钮-------------------
            // OutlinedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.cancel, color: Colors.red),
            //   label: const Text("取消"),
            // ),
          ],
        ),
      ),
    );
  }
}
