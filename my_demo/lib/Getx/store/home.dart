import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/Getx/store/countController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* 
    Get有一个简单而强大的依赖管理器，它允许你只用1行代码就能检索到与你的Bloc或Controller相同的
    类，无需Provider context，无需inheritedWidget。
    Get.put(CountController())进行控制器实例的创建，这样我们就算不使用控制器实例也会被创建
      Get.put()： 不使用控制器实例也会被创建
      Get.lazyPut()： 懒加载方式创建实例，只有在使用时才创建
      Get.putAsync()： Get.put() 的异步版版本
      Get.create()： 每次使用都会创建一个新的实例
  */
  CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              "${countController.count}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              countController.inc();
            },
            child: const Text("数值+1"),
          ),
        ],
      ),
    );
  }
}
