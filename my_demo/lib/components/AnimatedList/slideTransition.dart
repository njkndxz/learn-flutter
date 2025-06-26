import 'package:flutter/material.dart';

class _Silder extends StatefulWidget {
  const _Silder({super.key});

  @override
  State<_Silder> createState() => __SilderState();
}

class __SilderState extends State<_Silder> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SilderTransition')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flag ? _controller.forward() : _controller.reverse();
          flag != flag;
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        children: [
          /* SlideTransition(
            position: _controller.drive(
              Tween(
                begin: Offset(0.0, 0.0),
                end: Offset(1.0, 0.0),
              ).chain(CurveTween(curve: const Interval(0, 0.2))),
            ),
            child: Container(width: 120, height: 60, color: Colors.blue[300]),
          ),
          SlideTransition(
            position: _controller.drive(
              Tween(
                begin: Offset(0.0, 0.0),
                end: Offset(1.0, 0.0),
              ).chain(CurveTween(curve: const Interval(0.2, 0.4))),
            ),
            child: Container(width: 120, height: 60, color: Colors.blue[500]),
          ),
          SlideTransition(
            position: _controller.drive(
              Tween(
                begin: Offset(0.0, 0.0),
                end: Offset(1.0, 0.0),
              ).chain(CurveTween(curve: const Interval(0.4, 0.6))),
            ),
            child: Container(width: 120, height: 60, color: Colors.blue[700]),
          ), */
          SilderBox(
            animationController: _controller,
            color: Colors.blue[300],
            curve: const Interval(0, 0.2),
          ),
          SilderBox(
            animationController: _controller,
            color: Colors.blue[500],
            curve: const Interval(0.2, 0.4),
          ),
          SilderBox(
            animationController: _controller,
            color: Colors.blue[700],
            curve: const Interval(0.4, 0.6),
          ),
        ],
      ),
    );
  }
}

// 封装SilderBox
class SilderBox extends StatefulWidget {
  final AnimationController animationController;
  final Color? color;
  final Curve curve;

  const SilderBox({
    super.key,
    required this.animationController,
    this.color,
    required this.curve,
  });

  @override
  State<SilderBox> createState() => _SilderBoxState();
}

class _SilderBoxState extends State<SilderBox> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      /*  position: widget.animationController.drive(   // animationController.drive方法
        Tween(
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 0.0),
        ).chain(CurveTween(curve: widget.curve)),
      ), */
      position: Tween(begin: Offset(0.0, 0.0), end: Offset(1.0, 0.0))     // Tween组件的animate方法
          .chain(CurveTween(curve: widget.curve))
          .animate(widget.animationController),
      child: Container(width: 120, height: 60, color: widget.color),
    );
  }
}
