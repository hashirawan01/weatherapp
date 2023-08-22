import 'package:flutter/material.dart';
import 'package:weatherapp/Model/model.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String Temprature="loading";
  void startApp()async{
    Model model=Model(getlat: 44.34, getlang: 10.99);
   await model.getData();
    late String temp=model.temp;
    late String humidity=model.humidity;
    late String air_speed=model.air_speed;
    late String description=model.description;
    late String mainDescription=model.mainDescription;
    Navigator.pushNamed(context, '/home')
  }
  @override
  void initState() {
    startApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [

          IconButton(onPressed:(){ Navigator.pushNamed(context, "/home");}, icon: Icon(Icons.home))
        ],
      )),
    );
  }
}
