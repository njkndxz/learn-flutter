import 'dart:async';

import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  /* 
    关于GlobalKey： 每个 Widget 都对应一个 Element ，我们可以直接对 Widget 进行操作，但是无法直
    接操作 Widget 对应的 Element 。而 GlobalKey 就是那把直接访问 Element 的钥匙。通过 GlobalKey
    可以获取到 Widget 对应的 Element 。
   */
  final globaKey = GlobalKey<AnimatedListState>();
  List<String> list = ["第一条数据", "第二条数据"];
  bool flag  = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _buildItem(context, index) {
    return ListTile(
      key: ValueKey(index),
      title: Text(list[index]),
      trailing: IconButton(
        // 点击时删除
        onPressed: () => _deleteItem(context, index),
        icon: Icon(Icons.delete),
      ),
    );
  }

  _deleteItem(context, index) {
    if (flag == true) {
      flag = false;
      //注意：删除后需要重新setState
      setState(() {
        // 删除过程执行的是反向动画，animation.value 会从1变为0
        globaKey.currentState!.removeItem(index, (context, animation) {
          //注意先build然后再去删除
          var item = _buildItem(context, index);
          list.removeAt(index);
          return ScaleTransition(scale: animation, child: item,);
        }, duration: Duration(milliseconds: 500));
      });
      //解决快速删除bug 重置flag
      Timer.periodic(Duration(milliseconds: 600), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("动态列表组件")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add("这是一个数据");
          globaKey.currentState!.insertItem(list.length - 1);
        },
        child: const Icon(Icons.add),
      ),
      /* body: AnimatedList(
        key: globaKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: ListTile(
              title: Text(list[index]),
              trailing: Icon(Icons.delete),
            ),
          );
        },
      ), */
      /* body: AnimatedList(
        key: globaKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return ScaleTransition(
            scale: animation,
            child: ListTile(
              title: Text(list[index]),
              trailing: Icon(Icons.delete),
            ),
          );
        },
      ), */
      body: AnimatedList(
        key: globaKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: _buildItem(context, index)
          );
        },
      ),
    );
  }
}
