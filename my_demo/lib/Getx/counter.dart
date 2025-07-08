import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title: const Text("Getx 响应式数据计数器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            // 在UI中，当你想显示该值并在值变化时更新页面，只需这样做使用Obx传入函数返回组件
            Obx(() => Text("$_counter, ${p.name.value}的年龄: ${p.age.value}"))
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