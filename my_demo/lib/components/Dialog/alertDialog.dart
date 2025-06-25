import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
            context: context,
            builder: (context) {
              // ---- 返回一个AlertDialog
              return AlertDialog(
                title: const Text('提示信息'),
                content: const Text("确定要删除吗?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      print("点击了取消按钮");

                      Navigator.pop(context); // 关闭窗口
                    },
                    child: const Text('取消'),
                  ),
                  TextButton(
                    child: const Text("确定"),
                    onPressed: () {
                      print("点击了确定按钮");
                      Navigator.pop(context); // 关闭窗口
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Text('AlertDialog'),
      ),
    );
  }
}
