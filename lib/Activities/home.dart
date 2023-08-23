import 'dart:convert';
import 'dart:math';

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
    var citynames=["LAhore,Karachi,Failsbad"];
    final random=new Random();
    var city=citynames[random.nextInt(citynames.length)];

    Map? info=ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
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
                 stops: [0.3,0.9],
                 colors: [
               Colors.blue[800]!,
               Colors.blue[300]!,
             ])
           ),
           child: Column(
             children: [
               Container(

                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20),

                 ),
                 margin: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                 padding:EdgeInsets.symmetric(horizontal: 8),
                 child: Row(
                   children: [
                     GestureDetector(
                       onTap: null,
                         child:Container(child: Icon(Icons.search,color: Colors.blue,),margin: EdgeInsets.fromLTRB(2, 0, 5, 0)),
                     ),

                     Expanded(
                       child: TextField(
                         decoration: InputDecoration(
                           hintText: "search $city",
                           border: InputBorder.none
                         ),
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
                         color: Colors.white.withOpacity(0.5)
                       ),
                       padding: EdgeInsets.all(26),
                       child: Row(
                         children: [
                           // Image.network("bs"),
                           Column(
                             children: [
                               Text("LAhore ",style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18
                               ),
                               ),
                               Text("temprature"),
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
                       margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(14),
                           color: Colors.white.withOpacity(0.5)
                       ),
                       padding: EdgeInsets.all(26),
                       child: Text("data"),
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
                           color: Colors.white.withOpacity(0.5)
                       ),
                       padding: EdgeInsets.all(26),
                       child: Text("data"),
                     ),
                   ),
                   
                   Expanded(
                     child: Container(
                       height: 150,
                       margin: EdgeInsets.symmetric(horizontal: 20),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(14),
                           color: Colors.white.withOpacity(0.5)
                       ),
                       padding: EdgeInsets.all(26),
                       child: Text("data"),
                     ),
                   ),

                 ],

               ),
               SizedBox(height: 80,),
               Text("Waether app",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20,color: Colors.white),),
               SizedBox(height: 10,),
               Text("Made By Hashir Awan",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,color: Colors.white),),
             ],

           ),
         )),
      );
  }
}
