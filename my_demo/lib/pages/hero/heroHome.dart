import 'package:flutter/material.dart';
import 'package:my_demo/contants/listData.dart';

class HeroHome extends StatefulWidget {
  const HeroHome({super.key});

  @override
  State<HeroHome> createState() => _HeroHomeState();
}

class _HeroHomeState extends State<HeroHome> {
  List<Widget> _getListData() {
    return listData.map((value) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/hero",
            arguments: {
              "imageUrl": value["imageUrl"],
              "initialPage": value["id"],
              "listData": listData
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(233, 233, 233, 0.9),
              width: 1,
            ),
          ),
          child: Column(
            children: <Widget>[
              Hero(
                tag: value["imageUrl"],
                child: Image.network(value["imageUrl"]),
              ),
              const SizedBox(height: 10),
              Text(
                value['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0, //水平子 Widget 之间间距
      mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2, //一行的 Widget 数量
      // childAspectRatio:0.7,  //宽度和高度的比例
      children: _getListData(),
    );
  }
}
