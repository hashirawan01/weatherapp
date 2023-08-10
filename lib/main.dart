
import 'package:flutter/material.dart';
import 'package:weatherapp/Activities/loading.dart';
import 'package:weatherapp/Activities/location.dart';

import 'Activities/home.dart';

void main() {
  runApp(MaterialApp(
    routes: {'/': (context) => Loading(), '/home': (context) => Home(),'/location':(context)=>Location()},
  ));
}
