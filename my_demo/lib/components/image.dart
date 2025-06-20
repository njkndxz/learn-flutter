import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: const Center(
        child: CircleAvatar(        // 外面的圆形，用来设置边框
          radius: 110,              // 用来设置边框的圆形半径
          backgroundColor: Color(0xffc95863), // 外面的圆形的背景，作为边框颜色
          child: CircleAvatar(
              radius: 100,                          // 设置圆形图片的半径
              backgroundImage: AssetImage('assets/images/0.png'),
            ),
        )
        /* child: ClipOval(    // ClipOval 是一个用于剪裁子部件的小部件，将其剪裁为椭圆形的形状
          child: Image.network(
              "http://doubibiji.com/open-assets/img/telangpu2.jpg", // 设置背景颜色
              width: 200,
              height: 200,
              fit: BoxFit.cover, // 设置图片显示的适配模式
            )
        )， */
       /*  child: Container(   // 使用Container制作圆形图片
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(150),
            image: const DecorationImage(
              image: NetworkImage(
                "http://doubibiji.com/open-assets/img/telangpu2.jpg"
              ),
              // AssetImage('assets/images/0.png'),
              fit: BoxFit.cover
            )
          ),
          /* child: Image.network(
              "http://doubibiji.com/open-assets/img/telangpu2.jpg", // 设置背景颜色
              fit: BoxFit.cover, // 设置图片显示的适配模式
              repeat: ImageRepeat.repeat, // 设置图片平铺
            ), */
          /* child: Image.asset(
              "assets/images/0.png", // 设置背景颜色
              fit: BoxFit.cover, // 设置图片显示的适配模式
          ), */
        ), */
      ),
    );
  }
}
