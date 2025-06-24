import 'package:flutter/material.dart';

class UserAccountsDrawerPage extends StatefulWidget {
  const UserAccountsDrawerPage({super.key});

  @override
  State<UserAccountsDrawerPage> createState() => _UserAccountsDrawerPageState();
}

class _UserAccountsDrawerPageState extends State<UserAccountsDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      body: const Center(child: Text('Doubi'),),
      // ------------添加左侧边栏---------------
      drawer: Drawer(
        child: Column(
          children: const [
            // ------------DrawerHeader 的使用---------------
            DrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.blue,			// 设置背景颜色
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text('我是一个头部')
                  ],
                ),
              )
            ),
            // ------------UserAccountsDrawerHeader 的使用---------------
            UserAccountsDrawerHeader(
              accountName: Text('笔记'), 
              accountEmail: Text('www.doubi.com'),
              currentAccountPicture: CircleAvatar( // 设置一个圆形的头像
                backgroundImage: NetworkImage("http://doubibiji.com/open-assets/img/telangpu.jpg"),
              ),
              decoration: BoxDecoration(color: Colors.lightBlue), // 设置背景，也可以设置背景图片
            ),
            // ------------继续添加两个选项---------------
            ListTile(
              title: Text('收藏'),
              leading: CircleAvatar(child: Icon(Icons.favorite),),
            ),
            Divider(),
            ListTile(
              title: Text('系统设置'),
              leading: CircleAvatar(child: Icon(Icons.settings),),
            )
          ],
        ),
      ),
    );
  }
}