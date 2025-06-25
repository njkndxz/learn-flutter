import 'package:flutter/material.dart';

class Simple extends StatelessWidget {
  const Simple({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
            context: context,
            builder: (context) {
              // ---- 创建SimpleDialog
              return SimpleDialog(
                title: const Text('请选择'),
                // ---- children是各个选项，这里使用的是SimpleDialogOption创建
                children: <Widget>[
                  SimpleDialogOption(
                    child: const Text("选项一"),
                    onPressed: () {
                      print("点击了选项一");
                      Navigator.pop(context); // 关闭窗口
                    },
                  ),
                  const Divider(),
                  SimpleDialogOption(
                    child: const Text("选项二"),
                    onPressed: () {
                      print("点击了选项二");
                      Navigator.pop(context); // 关闭窗口
                    },
                  ),
                  const Divider(),
                  SimpleDialogOption(
                    child: const Text("选项三"),
                    onPressed: () {
                      print("点击了选项三");
                      Navigator.pop(context); // 关闭窗口
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Text("SimpleDialog"),
      ),
    );
  }
}
