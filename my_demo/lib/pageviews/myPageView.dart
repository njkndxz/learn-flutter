import 'package:flutter/material.dart';

class _Pageview extends StatefulWidget {
  const _Pageview({super.key});

  @override
  State<_Pageview> createState() => __PageviewState();
}

class __PageviewState extends State<_Pageview> {
  final List<Widget> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i = 0; i < 10; i++) {
      _list.add(Mypageview(text: "$i"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('无限滚动加载')),
      body: PageView(
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          print(index);
          print(_list.length);
          if (index + 2 == _list.length) {
            setState(() {
              for (var i = 0; i < 10; i++) {
                _list.add(Mypageview(text: "$i"));
              }
            });
          }
        },
        children: _list,
      ),
    );
  }
}

class Mypageview extends StatefulWidget {
  final String text;

  const Mypageview({super.key, required this.text});

  @override
  State<Mypageview> createState() => _MypageviewState();
}

class _MypageviewState extends State<Mypageview> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
