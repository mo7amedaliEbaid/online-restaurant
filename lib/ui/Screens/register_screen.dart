import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:ecommerce_sqflite/ui/Screens/home_screen.dart';
import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /* go()
  async {
    _changeLoading();
    if (_formKey.currentState!.validate()) {
      await postDataProvider.register.call(usernameController.text.toString(),
          emailController.text.toString(),
          passwordController.text.toString())
          ?
      Navigator.of(context).push(DismissibleDialog<void>(
          over: new Over("Successfully Registered!","You are successfully registered",true)
      ))
          : Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CategoryScr()));
      _changeLoading();
    }
  }*/
  gotohome(BuildContext context)
  {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: scafoldcolor,
      body: Form(
        key: _formKey,
        child: Container(
          padding: size.width<480? EdgeInsets.fromLTRB(40, 10, 40, 20):EdgeInsets.fromLTRB(120, 10, 120, 20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(size.height * .03),
                    height: size.width<480?size.height * .30:size.height * .5,
                    width: size.width<480?size.width:size.width*.27,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/app_images/splash2.jpg'),
                          fit:size.width<480? BoxFit.contain:BoxFit.fill),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      children: [
                        Text(
                          'Our Restaurant',

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
                  TextFormField(

                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Required UserName';
                      }else if (value.isEmpty){
                        return 'Please Enter Your Required Password';
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      iconColor: Colors.grey,
                      prefixIcon: Icon(Icons.nest_cam_wired_stand,color: appbarcolor,),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'UserName',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Required Password';
                      }else if (value.isEmpty){
                        return 'Please Enter Your Required Password';
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock,color: appbarcolor,),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(_obscureText?Icons.visibility_off:Icons.visibility,color: appbarcolor,))),
                    obscureText: _obscureText,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: (){
                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPassScr()));
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                            MaterialStateProperty.all(appbarcolor)),
                        child: Text(
                          'Forgot Password?',
                          style: smallwhite,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        gotohome(context);
                      });

                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color:appbarcolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                            'LOGIN',
                            style: bigwhite
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: size.width * 0.3,
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
                        width: size.width * 0.3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {/*Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterScreen())
                    );*/
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: appbarcolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                            'Create Account'.toUpperCase(),
                            style: bigwhite),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

