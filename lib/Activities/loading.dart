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
  String City="Lahore";
  String Temprature="loading";
  void startApp(String cityname) async {
    if (cityname.isNotEmpty&&mounted) {
      try {
        List<Location> locations = await locationFromAddress(cityname);
        double latitude = locations[0].latitude;
        double longitude = locations[0].longitude;

        Model model = Model(getlat: latitude, getlang: longitude);

        await model.getData();
        String temp = model.temp;
        String humidity = model.humidity;
        String air_speed = model.air_speed;
        String description = model.description;
        String mainDescription = model.mainDescription;
        String Icon = model.icon;

        Navigator.pushReplacementNamed(context, '/home', arguments: {
          "temprature": temp,
          "humidity": humidity,
          "air_speed": air_speed,
          "description": description,
          "mainDescription": mainDescription,
          "icon": Icon,
          "city": cityname,
        });
      } catch (e) {
        // Handle the exception and show an error message to the user
        print("Hey babe error is: $e");

      }
    } else {
      print("error occurred");
    }
  }

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search != null && search.containsKey("searchText")) {
      City = search["searchText"] as String;

    }

    print("object");
    print(City);
    startApp(City);
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
