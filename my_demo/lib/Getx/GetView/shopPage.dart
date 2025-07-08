import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetView结合GetxController使用
class Countcontroller extends GetxController {
  var count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void inc() {
    count++;
    update(['fitst_count']);
  }

  void dec() {
    count--;
    update();
  }
}

// 继承GetView并使用状态管理
class ShopPage extends GetView {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //如果第一次使用还需要put
    var countcontroller = Get.put(Countcontroller());

    return Scaffold(
      appBar: AppBar(title: const Text("shop")),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("${countcontroller.count}")),
            ElevatedButton(
              onPressed: () {
                countcontroller.inc();
              },
              child: const Text("加1"),
            ),
          ],
        ),
      ),
    );
  }
}
