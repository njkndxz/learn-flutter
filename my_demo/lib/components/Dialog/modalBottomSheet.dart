import 'package:flutter/material.dart';

class Modalbottomsheet extends StatelessWidget {
  const Modalbottomsheet({super.key});

  void _show(BuildContext context) async {
    /* 
      调用 showDialog 和 showModalBottomSheet 方法的时候，是没有返回值的，
      我们也可以使用 Navigator.pop(context, "值") 来返回值。
     */
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 220,
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text("点赞"),
                onTap: () {
                  print("点击了点赞");
                  Navigator.pop(context, '点赞');
                },
              ),
              const Divider(),
              ListTile(
                title: const Text("转发"),
                onTap: () {
                  print("点击了转发");
                  Navigator.pop(context, '转发');
                },
              ),
              const Divider(),
              ListTile(
                title: const Text("收藏"),
                onTap: () {
                  print("点击了收藏");
                  Navigator.pop(context, '收藏');
                },
              ),
            ],
          ),
        );
      },
    );

    print("result:$result"); // 点击确定按钮时，打印确定，点击取消按钮时，打印取消
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _show(context);
        },
        child: const Text('showModalBottomSheet'),
      ),
    );
  }
}
