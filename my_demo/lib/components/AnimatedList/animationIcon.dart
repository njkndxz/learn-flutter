import 'package:flutter/material.dart';

class _Animationicon extends StatefulWidget {
  const _Animationicon({super.key});

  @override
  State<_Animationicon> createState() => _AnimationiconState();
}

class _AnimationiconState extends State<_Animationicon>
    with SingleTickerProviderStateMixin {
  // late延迟初始化  AnimationController
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化 AnimationController
    _controller = AnimationController(
      vsync: this, // 让程序和手机的刷新频率统一
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("交错式动画")),
      body: Center(
        child: Column(
          children: [
            AnimatedIcon(
              icon: AnimatedIcons.search_ellipsis,
              progress: _controller,
              color: Colors.red,
              size: 40,
            ),
            ElevatedButton(
              onPressed: () {
                _controller.forward();
              },
              child: const Text('播放'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.reverse();
              },
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

class DefineDemo extends StatefulWidget {
  const DefineDemo({super.key});

  @override
  State<DefineDemo> createState() => _DefineDemoState();
}

class _DefineDemoState extends State<DefineDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("交错式动画")),
      body: Column(
        children: [
          Stack(    // 定义Stack，使2个图标重叠摆放
            children: [
              // 默认显示搜索图标，
              // Tween(开始1，结束0)
              // Interval时间为0-0.5之间
              //
              // 搜索图标开始为1.0显示，结束时0.0隐藏，时间从0.0开始，到0.5结束
              // 关闭图标开始为0.0隐藏，结束时1.0显示，时间从0.5开始，到1.0结束
              ScaleTransition(
                scale: _animationController.drive(
                  Tween(
                    begin: 1.0,
                    end: 0.0,
                  ).chain(CurveTween(curve: const Interval(0, 0.5))),
                ),
                child: const Icon(Icons.search, size: 40,),
              ),
              ScaleTransition(
                scale: _animationController.drive(
                  Tween(
                    begin: 0.0,
                    end: 1.0,
                  ).chain(CurveTween(curve: const Interval(0.5, 1))),
                ),
                child: const Icon(Icons.close, size: 40,),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _animationController.forward();
            },
            child: const Text('播放'),
          ),
          ElevatedButton(
            onPressed: () {
              _animationController.reverse();
            },
            child: const Text('返回'),
          ),
        ],
      ),
    );
  }
}
