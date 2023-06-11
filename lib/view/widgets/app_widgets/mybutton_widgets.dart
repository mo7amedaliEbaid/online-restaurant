import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:flutter/material.dart';

Widget MyButton({required String name, GestureTapCallback? onTap}) {
  return ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appbarcolor)),
    onPressed: onTap,
    child: Text(name),
  );
}
