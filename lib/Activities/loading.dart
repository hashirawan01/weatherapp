import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "temprature" :temp,
   "humidity":humidity,
    "air_speed":air_speed,
   "description":description,
   "mainDescription":mainDescription,
    });
  }
  @override
  void initState() {
    startApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300
      ],
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/logo.png",height: 190,width: 190,)),
          SizedBox(height: 10,),
          Text("Waether app",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30,color: Colors.white),),
          SizedBox(height: 10,),
          Text("Made By Hashir Awan",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white),),
          SizedBox(height: 40,),
        SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
        ],
      )),
    );
  }
}
