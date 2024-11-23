import 'package:flutter/material.dart';

class Post extends StatelessWidget{

  final String title;
  final String subtitle;

  const Post(this.title, this.subtitle, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Text(subtitle, style: const TextStyle(color: Colors.black),),
      backgroundColor: Colors.yellow,
    );
  }
}