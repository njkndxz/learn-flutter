import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      //当我们导入依赖后，在应用程序顶层把 GetMaterialApp 作为顶层
      return GetMaterialApp(
        title: 'Getx',
        home: Scaffold(
          appBar: AppBar(title: Text("Getx Title"),),
          body: Theme()
        )
      );
    }
}

class Theme extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      //当我们导入依赖后，在应用程序顶层把 GetMaterialApp 作为顶层
      return Center(
        child: Column(
          children: [
            /* 
              我们可以通过 Get.bottomSheet() 来显示 BottomSheet ，通过 Get.back() 实现路由返回，通过
              Get.changeTheme(ThemeData.dark()) 切换皮肤主题，通过Get.isDarkMode判断主题样式。
            */
            ElevatedButton(
              child: const Text("Show BottomSheet"),
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Get.isDarkMode ? Colors.white:Colors.black,
                    height: 200,
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(Icons.wb_sunny_outlined,
                              color: Get.isDarkMode ? Colors.white:Colors.black,),
                            title: Text("白天模式", 
                                style: TextStyle(
                                  color: Get.isDarkMode ? Colors.white:Colors.black,
                                )
                              ),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                              Get.back();
                              Get.snackbar("Snackbar 标题", "欢迎使用Snackbar, 白天模式");
                            },
                        ),
                        ListTile(
                          leading: Icon(Icons.wb_sunny,
                              color: Get.isDarkMode ? Colors.white:Colors.black,),
                          title: Text("黑夜模式", style: TextStyle(
                            color: Get.isDarkMode ? Colors.white:Colors.black
                          )),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                            Get.back();
                            Get.snackbar("Snackbar 标题", "欢迎使用Snackbar, 黑夜模式");
                          }
                        ),
                      ]
                    )
                  )
                );
              }
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "提示",
                  middleText: "您确定退出登录吗?",
                  confirm: ElevatedButton(
                    onPressed: () {
                      print("确定");
                      Get.back();
                    },
                    child: const Text("确定")
                  ),
                  cancel: ElevatedButton(
                    onPressed: () {
                      print("取消");
                      Get.back();
                    }, 
                    child: const Text("取消")
                  ),
                );
              },
              child: const Text("显示默认的Dialog")
            )
          ]
        ),
      );
    }
}