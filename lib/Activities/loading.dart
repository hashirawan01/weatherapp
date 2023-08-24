import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/Model/model.dart';
import 'package:geocoding/geocoding.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String Temprature="loading";
  void startApp(String cityname)async{
    List<Location> locations = await locationFromAddress(cityname);
      double latitude = locations[0].latitude;
      double longitude = locations[0].longitude;

    Model model=Model(getlat: latitude, getlang: longitude);
   await model.getData();
    late String temp=model.temp;
    late String humidity=model.humidity;
    late String air_speed=model.air_speed;
    late String description=model.description;
    late String mainDescription=model.mainDescription;
    late String Icon=model.icon;
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "temprature" :temp,
   "humidity":humidity,
    "air_speed":air_speed,
   "description":description,
   "mainDescription":mainDescription,
      "icon":Icon,
      "city":cityname,
    });
  }
  @override
  void initState() {
    startApp("Lahore");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map;
    if(info.isNotEmpty ??false) {
      String cityname = info["searchText"];
      print(cityname);
    }
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
