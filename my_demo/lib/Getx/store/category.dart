import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/Getx/store/countController.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  // 可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你
  final CountController countController = Get.find();

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
              countController.dec();
            },
            child: const Text("数值-1"),
          ),
        ],
      ),
    );
  }
}
