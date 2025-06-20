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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        // ------------------这里是在ListView中添加的Card组件----------------------
        body: ListView(
          children: [
            // ------------------第一个Card------------------
            Card(
              margin: const EdgeInsets.all(10),         // 设置卡片外边距
              elevation: 10,                            // 设置卡片的阴影
              shadowColor: Colors.grey,                 // 设置阴影的颜色，有默认值，可以不设置
              shape: const RoundedRectangleBorder(      // 设置卡片的圆角，想调整圆角弧度，可以设置
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              // ------------------在Card中添加子组件，这里使用了一个列排序------------------
              child: Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 40, // 设置圆形图片的半径
                      backgroundImage: NetworkImage(
                          "http://doubibiji.com/open-assets/img/telangpu.jpg" // 网络图片的地址
                          ),
                    ),
                    title: Text("特朗普"),
                    subtitle: Text("前美国总统"),
                  ),
                  Divider(color: Colors.grey.shade400, indent: 10, endIndent: 10, thickness: 1),
                  const ListTile(
                    title: Text("党派：共和党", style: TextStyle(fontSize: 16),),
                  ),
                  const ListTile(
                    title: Text("口号：Make America great again"),
                  )
                ],
              ),
            ),
            // ------------------第二个Card------------------
            Card(
              margin: const EdgeInsets.all(10),       // 设置卡片外边距
              elevation: 10,                          // 设置卡片的阴影
              shadowColor: Colors.grey,               // 设置阴影的颜色，有默认值，可以不设置
              shape: const RoundedRectangleBorder(    // 设置卡片的圆角，想调整圆角弧度，可以设置
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 40, // 设置圆形图片的半径
                      backgroundImage: NetworkImage(
                          "http://doubibiji.com/open-assets/img/baideng.jpg" // 网络图片的地址
                      ),
                    ),
                    title: Text("拜登"),
                    subtitle: Text("现任美国总统"),
                  ),
                  Divider(color: Colors.grey.shade400, indent: 10, endIndent: 10, thickness: 1),
                  const ListTile(
                    title: Text("党派：民主党", style: TextStyle(fontSize: 16),),
                  ),
                  const ListTile(
                    title: Text("口号：Let me think"),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}