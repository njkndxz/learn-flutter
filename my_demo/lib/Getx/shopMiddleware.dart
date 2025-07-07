import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShopMiddleWare extends GetMiddleware {
  @override
  // 优先级越低越先执行
  int? get priority => -1;

  // 当被调用路由的页面被搜索时，这个函数将被调用。它将RouteSettings作为重定向的结果。或者给它null，就没有重定向了
  @override
  RouteSettings redirect(String? route) {
    return const RouteSettings(name: '/login');
  }
}
