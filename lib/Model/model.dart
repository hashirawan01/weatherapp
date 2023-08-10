import 'dart:convert';

import 'package:http/http.dart';

class Model{
  late double getlat;
  late double getlang;
  Model({required this.getlat,required this.getlang}){
    getlat=this.getlat;
    getlang=this.getlang;

  }
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String mainDescription;




  Future <void>getData() async{
    Uri url=Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$getlat&lon=$getlang&appid=981719515a4bd2e4d4feb88a720a8774");
    Response response=await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      //getting data from different apis variables
      Map temp_data=data['main'];
      String gethumiidty=temp_data['humidity'].toString();
      double gettemp=temp_data['temp'];


      Map wind=data['wind'];
      double getair_speed=wind['speed'];



      List weather_data=data['weather'];
      Map weather_main_data =weather_data[0];
      String getmain_desc=weather_main_data['main'];
      String getdesc=weather_main_data['description'];

    //assigning values
      temp=gettemp.toString();
      humidity=gethumiidty;
      air_speed=getair_speed.toString();
      mainDescription=getmain_desc.toString();
      description=getdesc.toString();


    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }
}