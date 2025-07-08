import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_demo/Getx/messages/msg.dart';
import 'package:my_demo/Getx/store/allControllerBinding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      // 1. 在项目启动时进行初始化绑定
      initialBinding: Allcontrollerbinding(),
      /* 
          translations： 国际化配置文件
          locale： 设置默认语言，不设置的话为系统当前语言
          fallbackLocale：添加一个回调语言选项，以备上面指定的语言翻译不存在
       */
      translations: Msg(), // 你的翻译
      locale:const Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
      fallbackLocale:const Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
    );
  }
    
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 要想让它变得可观察，你只需要在它的末尾加上".obs"。使用Rx{type}
  RxInt _counter = 0.obs;
  final _counter1 = Rx<int>(0);
  final _counter2 = RxInt(0);

  // 2. 在页面中使用状态管理器
  final countController = Get.find();

  final p = Person();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 调用语言包: 只要将 .tr 追加到指定的键上，就会使用 Get.locale 和 Get.fallbackLocale 的当前值进行翻译
        title: Text("Getx 响应式数据计数器".tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            // 在UI中，当你想显示该值并在值变化时更新页面，只需这样做使用Obx传入函数返回组件
            Obx(() => Text("$_counter, ${p.name.value}的年龄: ${p.age.value}")),
            ElevatedButton(onPressed: () {
              /* 
                调用 Get.updateLocale(locale) 来更新语言环境。然后翻译会自动使用新的locale。
                更新后所有页面生效
               */
              var locale = Locale('zh', 'CN');
              Get.updateLocale(locale);
            }, child: const Text("切换到中文")),
            ElevatedButton(onPressed: () {
              var locale = Locale('zh', 'CN');
              Get.updateLocale(locale);
            }, child: const Text("切换到英文"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _counter++;
        p.age.value++;
      }, tooltip: '加1',child: const Icon(Icons.add),),
    );
  }
}

// 监听自定义类数据的变化
class Person {
  RxString name = "Barry".obs;
  RxInt age = 22.obs;
}