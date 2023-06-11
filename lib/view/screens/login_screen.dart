import 'package:ecommerce_sqflite/constants/app_consts.dart';
import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:ecommerce_sqflite/view/screens/home_screen.dart';
import 'package:ecommerce_sqflite/view/screens/register_screen.dart';
import 'package:ecommerce_sqflite/view/widgets/auth_widgets/buildimage_widget.dart';
import 'package:ecommerce_sqflite/view/widgets/auth_widgets/formfields_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/auth_widgets/authbutton_widget.dart';
import '../widgets/auth_widgets/myseparator_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  gotohome(BuildContext context, String user) async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var username = prefs.getString("username");
      username != user && username == null
          ? Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RegisterScreen()))
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldcolor,
      body: Form(
        key: _formKey,
        child: Container(
          padding: size.width < 480
              ? EdgeInsets.fromLTRB(40, 10, 40, 20)
              : EdgeInsets.fromLTRB(120, 10, 120, 20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildImage(context),
                  Container(
                    width: 200,
                    child: Column(
                      children: [
                        Text(
                          AppConstants.restaurantname,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Please Login to your Account',
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyFormField(context, usernameController, true, "User Name"),
                  SizedBox(
                    height: 20,
                  ),
                  PassFormField(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPassScr()));
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(lightblue)),
                        child: Text(
                          'Forgot Password?',
                          style: tinywhite,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          gotohome(context,
                              usernameController.text.trim().toString());
                        });
                      },
                      child: AuthButton("Login", context)),
                  SizedBox(
                    height: 20,
                  ),
                  MySeparator(),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                      },
                      child: AuthButton("Create Account", context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
