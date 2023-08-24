import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = new TextEditingController();
  int conter = 1;

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
    var citynames = ["LAhore,Karachi,Failsbad"];
    final random = new Random();
    var city = citynames[random.nextInt(citynames.length)];
    //here i can get data through rote from loading class
    Map? info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = (info["temprature"].toString().substring(0, 4));
    String IconVAlue = info["icon"];
    String Cityvalue = info["city"];
    String Humvalue = info["humidity"];
    String Airspeedvalue = info["air_speed"].toString().substring(0, 2);
    String Descvalue = info["description"];
    print(Cityvalue);
    print(IconVAlue);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                stops: [
              0.3,
              0.9
            ],
                colors: [
              Colors.blue[800]!,
              Colors.blue[300]!,
            ])),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 6),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if((textEditingController.text).replaceAll(" ", "")==("")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please enter any city name first")),
                        );
                      }else{
                        Navigator.pushReplacementNamed(context, '/loading',
                            arguments: {
                              "searchText": textEditingController.text
                            });

                      }
                    },
                    child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.fromLTRB(2, 0, 5, 0)),
                  ),
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          hintText: "search $city", border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(26),
                    child: Row(
                      children: [
                        Image.network(
                            "https://openweathermap.org/img/wn/$IconVAlue@2x.png"),
                        Column(
                          children: [
                            Text(Descvalue,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(
                              "IN $Cityvalue",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(temp),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/thermometer.png",
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              temp,
                              style: TextStyle(fontSize: 35),
                            ),
                            Text(
                              "C",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/humidity.png",
                              height: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Humidity $Humvalue"),
                        Text("km/h"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white.withOpacity(0.5)),
                    padding: EdgeInsets.all(26),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              height: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("AirSpeed $Airspeedvalue"),
                        Text("km/h"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              "Waether app",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made By Hashir Awan",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            ),
          ],
        ),
      )),
    );
  }
}
