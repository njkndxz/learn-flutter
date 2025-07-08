import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Shopcontroller extends GetxController {
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


class Shopbinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Shopcontroller());
  }
}

class ShopPage extends GetView {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("shop")),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("${controller.count}")),
            ElevatedButton(
              onPressed: () {
                controller.inc();
              },
              child: const Text("加1"),
            ),
          ],
        ),
      ),
    );
  }
}