import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  // 接收标题
  String title;

  // 接收内容
  String content;

  // 接收关闭按钮的回调函数
  Function()? onClosed;

  MyDialog({
    super.key,
    required this.title,
    required this.onClosed,
    this.content = '',
  });

  // ---- 使用定时器定时关闭窗口
  void _showTimer(context) {
    Timer.periodic(Duration(milliseconds: 3000), (t) {
      print('自动关闭');
      Navigator.pop(context);
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // ---- 打开定时器
    // _showTimer(context);

    // TODO: implement build
    return Material(
      // 定义显示是透明的
      type: MaterialType.transparency,
      // center 会铺满整个屏幕
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  // ---- 定义标题和关闭按钮
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(title),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: onClosed,
                        child: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              // ---- 定义显示的内容
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Text(content, textAlign: TextAlign.left,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
