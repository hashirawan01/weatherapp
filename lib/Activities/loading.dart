import 'package:flutter/material.dart';
import 'package:weatherapp/Model/model.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void startApp()async{
    Model model=Model(getlat: 44.34, getlang: 10.99);
   await model.getData();
    print(model.air_speed);
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
