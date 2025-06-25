import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


/* 
    如果把LocalKey比作局部变量， GlobalKey就类似于全局变量
下面使用了LocalKey，当屏幕状态改变的时候把 Colum换成了Row，Box的状态就会丢失
在前面我们介绍过一个Widget状态的保存主要是通过判断组件的类型或者key值是否一致。LocalKey只
在当前的组件树有效，所以把Colum换成了Row的时候Widget的状态就丢失了。为了解决这个问题我们
就可以使用GlobalKey
 */
class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();

  List<Widget> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      Box(key: _key1, color: Colors.blue),
      Box(key: _key2, color: Colors.red),
      Box(
        key: _key3, //程序自动生成一个key
        color: Colors.orange,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.shuffle(); //打乱list的顺序
            /* 
              globalKey.currentState 可以获取子组件的状态，执行子组件的方法，
              globalKey.currentWidget可以获取子组件的属性，
              _globalKey.currentContext!.findRenderObject()可以获取渲染的属性
            */
            var state = (_key1.currentState as _BoxState);
            print("_key1的$state");
            var box = (_key1.currentWidget as Box);
            print(box.color);
            var renderBox = (_key1.currentContext!.findRenderObject() as RenderBox);
            print(renderBox.size);
          });
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(title: const Text('Title')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  Color color;
  Box({super.key, required this.color});
  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(widget.color),
        ),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Center(child: Text("$_count")),
      ),
    );
  }
}
