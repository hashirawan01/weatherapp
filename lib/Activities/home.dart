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
  getData() async{
    Uri url=Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=981719515a4bd2e4d4feb88a720a8774");
    Response response=await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body); // Decode JSON
      print(data);
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }
  int conter=1;
  @override
  void initState() {
    getData();
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
          FloatingActionButton(onPressed: ()=>setState(() {
            conter+=1;
          })),
          Text("$conter"),
        ],
      )
    );
  }
}
