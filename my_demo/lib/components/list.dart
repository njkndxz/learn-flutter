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
      appBar: AppBar(title: const Text('Demo')),
      // ----------------------Divider的使用--------------------------
      body: SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal, // 设置ListView的方向
          padding: const EdgeInsets.fromLTRB(
            0,
            10,
            0,
            0,
          ), // 列表距离上面过于接近，这里设置一下padding
          children: [
            ListTile(
              leading: Icon(Icons.payment, color: Colors.red, size: 30),
              title: Text("待付款"),
              trailing: Icon(Icons.navigate_next), // 右边添加一个箭头
            ),
            const Divider(), // 添加分隔线
            ListTile(
              leading: Icon(
                Icons.electric_rickshaw,
                color: Colors.green,
                size: 30,
              ),
              title: Text("待收货"),
              trailing: Icon(Icons.navigate_next), // 右边添加一个箭头
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.domain_verification,
                color: Colors.orange,
                size: 30,
              ),
              title: Text("待评价"),
              trailing: Icon(Icons.navigate_next), // 右边添加一个箭头
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.assessment,
                color: Color(0xff9fbad3),
                size: 30,
              ),
              title: Text("特朗普"),
              trailing: Icon(Icons.navigate_next), // 右边添加一个箭头
            ),
            const Divider(),
            ListTile(
              leading: Image.network(
                fit: BoxFit.cover,
                width: 80,
                "http://doubibiji.com/open-assets/img/pujing.jpg",
              ),
              title: Text('普京斥西方“自私的新殖民主义”:北约可能要将黑手伸向亚洲'),
            ),
            const Divider(),
            ListTile(
              leading: Image.network(
                fit: BoxFit.cover,
                width: 80, // leading 默认是占据 ListTile 的高度，所以这里Image的高度调整不了
                "http://doubibiji.com/open-assets/img/baideng.jpg",
              ),
              title: const Text(
                "特朗普称拜登是个疯子",
                maxLines: 1,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: const Text(
                "特朗普对拜登的攻击不仅限于政策层面。他指责拜登不仅愚蠢和无能……他已经疯了，是个彻头彻尾的疯子",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const Divider(),
            // --------------------- item ---------------------
            ListTile(
              trailing: Image.network(
                // trailing 也可以设置成图片
                fit: BoxFit.cover,
                width: 80,
                "http://doubibiji.com/open-assets/img/telangpu.jpg",
              ),
              title: const Text(
                "特朗普指责拜登送他上法庭",
                maxLines: 1,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: const Text(
                "报道提到，特朗普目前在共和党总统初选民调中遥遥领先，他指责美国总统拜登下令对他进行调查。 ",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
