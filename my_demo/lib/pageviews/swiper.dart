import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_demo/pages/keepalive/keepalive.dart';

class PageSwiper extends StatefulWidget {
  const PageSwiper({super.key});

  @override
  State<PageSwiper> createState() => _PageSwiperState();
}

class _PageSwiperState extends State<PageSwiper> {
  final List<Widget> _pageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List listData = [
      {"imageUrl": 'https://www.itying.com/images/flutter/1.png'},
      {"imageUrl": 'https://www.itying.com/images/flutter/2.png'},
      {"imageUrl": 'https://www.itying.com/images/flutter/3.png'},
    ];

    for (var i = 0; i < listData.length; i++) {
      setState(() {
        _pageList.add(
          KeepAliveWrapper(keepAlive: true, child: Picture(url: listData[i]["imageUrl"]))
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('轮播图')),
      body: ListView(children: [Swiper(pageList: _pageList)]),
    );
  }
}

class Swiper extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> pageList;

  const Swiper({
    super.key,
    required this.pageList,
    this.width = double.infinity,
    this.height = 200,
  });

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  
  int _currentIndex = 0;
  late Timer t;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /* t = Timer.periodic(Duration(seconds: 3), (timer) {
      print('afterTimer=' + DateTime.now().toString());
      // timer.cancel() // 取消定时器
    }); */

    /* 
      使用PageController实现自动轮播
     */
    _pageController = PageController(initialPage: _currentIndex);

    _pageController.animateToPage(
      (_currentIndex + 1) % widget.pageList.length,
      duration: const Duration(seconds: 3),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    t.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 100,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index % widget.pageList.length;
              });
            },
            itemBuilder: (context, index) {
              return widget.pageList[index % (widget.pageList.length)];
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.pageList.length, (i) {
              return Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == i ? Colors.green : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class Picture extends StatefulWidget {
  final String url;
  final double width;
  final double height;

  const Picture({
    super.key,
    required this.url,
    this.height = 200,
    this.width = double.infinity,
  });

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Image.network(widget.url, fit: BoxFit.cover),
    );
  }
}
