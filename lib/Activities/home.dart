import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int conter=1;
  @override
  void initState() {
    super.initState();
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          FloatingActionButton(onPressed: null),
          Text("kuch nahin babe"),
        ],
      )
    );
  }
}
