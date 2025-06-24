import 'package:flutter/material.dart';

class My extends StatefulWidget {
  const My({super.key});

  @override
  State<My> createState() => _HomeState();
}

class _HomeState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('主页'),);
  }
}