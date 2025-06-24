import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _HomeState();
}

class _HomeState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('主页'),);
  }
}