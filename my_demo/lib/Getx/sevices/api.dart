import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_demo/Getx/sevices/storageService.dart';



class ApiService extends GetxService {
  String api() {
    return "http://jdmall.itying.com/";
  }
}

void main() async {
  await initServices();
}

Future<void> initServices() async {
  print('初始化服务');
  await Get.putAsync(() async => ApiService());
  await Get.putAsync(() async => StorageService());
  print("所有服务启动");
  
  // 调用服务
  // Get.find<ApiService>().api();
  // Get.find<StorageService>().getCounter();
}