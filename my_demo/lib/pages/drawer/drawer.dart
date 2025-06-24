import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      body: const Center(
          child: Text("Doubi")
      ),
      // ------------添加左侧边栏---------------
      drawer: const Drawer(
        child: Text('左侧边栏'),
      ),
      // ------------添加右侧边栏---------------
      endDrawer: const Drawer(
        child: Text('右侧边栏')
      )
    );
  }
}