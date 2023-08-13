import 'package:ecommerce_sqflite/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyRestaurant());
}

class MyRestaurant extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
