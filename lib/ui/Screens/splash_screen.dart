import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:ecommerce_sqflite/ui/Screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_widgets/popup_authwidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextView();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldcolor,
      body: Container(
        height: size.height,
        width: size.width,
        child: Image.asset('assets/app_images/splash2.jpg'
        ,fit: size.width<480?BoxFit.fitHeight:BoxFit.contain,
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(
          AuthPopUp<void>());
    });
  }
}
