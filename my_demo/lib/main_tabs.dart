import 'package:flutter/material.dart';
import 'package:my_demo/pages/tabs/home.dart';
import 'package:my_demo/pages/tabs/message.dart';
import 'package:my_demo/pages/tabs/my.dart';
import 'package:my_demo/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // ---- 3.初始化路由，初始化进入的页面
      initialRoute: '/',
      // ---- 2.所有的路由统一配置到这里
      /* routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchPage(content: '从main_tabs来'),
        '/message': (context) => const Message(),
      }, */
      // 2、调用onGenerateRoute处理
      onGenerateRoute: onGenerateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabPages = const [HomePage(), Message(), My()];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _tabPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 设置当前选中的tab
        fixedColor: Colors.green, // 设置tab选中的颜色
        iconSize: 25, // 设置图标的大小
        type: BottomNavigationBarType.fixed, // 如果tab大于3个，则需要设置该属性才能显示
        items: const [
          // 设置tabbar按钮
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "我的",
          ),
        ],
        onTap: (index) {
          setState(() {
            // 点击tabbar按钮的时候触发
            // 当点击tabbar的时候修改_currentIndex，从而让body部分修改指向的页面，实现切换页面
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: Container(
        // 这里使用Container包裹，是为了调整FloatingActionButton的大小和微调一下按钮位置
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(top: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2
              ? Colors.green
              : Colors.blue, // 这里主要是设置中间按钮的颜色，当选中了tabbar中间的按钮的时候，则将悬浮按钮的颜色改为绿色
          onPressed: () {
            setState(() {
              _currentIndex = 1; // 当点击悬浮按钮的时候，选中发布页面
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // 设置悬浮按钮的位置
    );
  }
}
