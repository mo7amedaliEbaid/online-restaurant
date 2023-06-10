import 'package:flutter/material.dart';
Widget BuildImage(BuildContext context){
  Size size=MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.all(size.height * .03),
    height:
    size.width < 480 ? size.height * .30 : size.height * .5,
    width: size.width < 480 ? size.width : size.width * .27,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/app_images/splash2.jpg'),
          fit: size.width < 480 ? BoxFit.contain : BoxFit.fill),
    ),
  );
}