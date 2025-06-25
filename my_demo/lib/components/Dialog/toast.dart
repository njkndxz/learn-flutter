import 'package:flutter/material.dart';
// ----1.引入fluttertoast
import 'package:fluttertoast/fluttertoast.dart';

class Toast extends StatelessWidget {
  const Toast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Demo')
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ---- 2.显示Toast
                Fluttertoast.showToast(
                  msg: "这是一个Toast消息",
                  toastLength: Toast.LENGTH_SHORT, // Toast 显示时长
                  gravity: ToastGravity.BOTTOM,    // Toast 位置
                  timeInSecForIosWeb: 1,          // iOS/Web 上的显示时长
                  backgroundColor: Colors.grey,   // 背景颜色
                  textColor: Colors.white,        // 文本颜色
                  fontSize: 16.0,                 // 文本大小
                );
          },
          child: const Text('Toast'),
      )
    )
    );
  }
}
