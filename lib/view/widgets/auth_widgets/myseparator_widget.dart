import 'package:flutter/material.dart';
Widget MySeparator(){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.black,
        height: 2,
        width: 100,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        'OR',
        // style: bigStyle,
      ),
      SizedBox(
        width: 5,
      ),
      Container(
        color: Colors.black,
        height: 2,
        width: 100,
      ),
    ],
  );
}