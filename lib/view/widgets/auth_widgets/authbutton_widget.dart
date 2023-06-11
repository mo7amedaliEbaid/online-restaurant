import 'package:flutter/material.dart';

import '../../../constants/global_consts.dart';
Widget AuthButton(String buttontext,BuildContext context){
  Size size=MediaQuery.of(context).size;
  return Container(
    padding: size.width<480?EdgeInsets.symmetric(vertical: 10):EdgeInsets.symmetric(vertical: 10),
    // height: 50,
    width: size.width<480?size.width*.7:size.width*.5,
    decoration: BoxDecoration(
        color: appbarcolor,
        borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: Text(
          buttontext.toUpperCase(),
          style: smallwhite),
    ),
  );
}