import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:ecommerce_sqflite/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  void goToNextView() {
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var username = prefs.getString("username");
      username == null
          ? Navigator.of(context).push(AuthPopUp<void>())
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldcolor,
      body: Container(
        height: size.height,
        width: size.width,
        child: Image.asset(
          'assets/app_images/splash2.jpg',
          fit: size.width < 480 ? BoxFit.fitHeight : BoxFit.contain,
        ),
      ),
    );
  }
}
