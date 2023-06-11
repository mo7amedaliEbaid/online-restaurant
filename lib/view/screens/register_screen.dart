import 'package:ecommerce_sqflite/constants/app_consts.dart';
import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../widgets/auth_widgets/buildimage_widget.dart';
import '../widgets/auth_widgets/formfields_widgets.dart';
import '../widgets/auth_widgets/myseparator_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_widgets/authbutton_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  gotohome(BuildContext context, String username) async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("username", username);
      Navigator.of(context).pushReplacement(
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
                        Text('Please Register For An Account',
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
                  MyFormField(context, emailController, false, "Email"),
                  SizedBox(
                    height: 20,
                  ),
                  PassFormField(context),
                  SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      gotohome(
                          context, usernameController.text.trim().toString());
                    },
                    child: AuthButton("Create Account", context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MySeparator(),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: AuthButton("Login", context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
