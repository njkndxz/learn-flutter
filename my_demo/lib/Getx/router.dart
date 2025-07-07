import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/Getx/shopMiddleware.dart';
import 'package:my_demo/pages/tabs/home.dart';
import 'package:my_demo/pages/tabs/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Getx 路由",
      home: Scaffold(
        appBar: AppBar(title: Text("GetX Title"),),
        body: RouteGetX()
      ),
      initialRoute: "/",
      // 可以设置页面切换默认动画
      defaultTransition: Transition.rightToLeftWithFade,
      //可以设置动态路由
      getPages: [
        GetPage(
          name: "/", 
          page: () => const HomePage(),
          middlewares: [ShopMiddleWare()]
        ),
        GetPage(
          name: "/message", 
          page: () => const Message(),
          transition: Transition.rightToLeft // 定义切换方式
        )
      ],
    );
  }
}


class RouteGetX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: () {
            // to方法切换路由
            Get.to(HomePage());
            // 接收路由参数
            print(Get.arguments);
          }, child: Text("跳转到首页")),
          ElevatedButton(onPressed: () {
            // toNamed方法切换命名路由
            Get.toNamed("/search", arguments: {
              "id": 20
            });
          }, child: Text("跳转到命名路由")),
          ElevatedButton(onPressed: () {
            // back方法返回上一级
            Get.back();
          }, child: Text("返回上一级")),
          ElevatedButton(onPressed: () {
            // offAll返回到根路由
            Get.offAll(const HomePage());
          }, child: Text("返回到根路由")),
          ElevatedButton(onPressed: () {
            // off替换页面，就是进入下一个页面且不能返回
            Get.off(const HomePage());
          }, child: Text("返回到根路由")),
        ]
      )
    );
  }
}