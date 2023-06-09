import 'package:flutter/material.dart';

Widget DotsIndicator(int activeIndex,int dotIndex){
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: (dotIndex == activeIndex ) ? Colors.black : Colors.grey[400],
          shape: BoxShape.circle
      ),
    ),
  );
}

