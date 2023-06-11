import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:flutter/material.dart';

import '../../screens/login_screen.dart';
import '../../screens/register_screen.dart';

class AuthPopUp<T> extends PopupRoute<T> {


  @override
  Color? get barrierColor => Colors.black.withAlpha(0x60);
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Successfully Registered!';

  @override
  Duration get transitionDuration => const Duration(seconds: 2);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Size size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: size.height*.15,
          right: size.width<480?0:size.width*.2,
          left: size.width<480?0:size.width*.2,
          child: Dialog(
            child: Container(
              height:size.width<480?size.height * .4:size.height * .6,
              width:size.width<480?size.width *.8:size.width*.5,
              padding:  EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: scafoldcolor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10.0,0,10),
                    child: Center(
                      child: Text("Welcome To Our Restaurant",style: deepstyle,),
                    )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0,10.0,0,10),
                      child: InkWell(
                        onTap:()async{
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegisterScreen()));
                        },
                        child: Container(
                          height:size.width<480? size.height*.065:size.height*.12,
                          width: size.width<480?size.width*.6:size.width*.35,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              border: Border.all(color: Colors.amber,width: 3),
                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: Center(child:  Text("Create A New Account",style: blackstyle,),),
                        ),
                      ),
                    ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.black,
                          height: 2,
                          width: size.width<480?size.width * 0.2:size.width * 0.14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'or',
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          height: 2,
                          width: size.width<480?size.width * 0.2:size.width * 0.14,
                        ),
                      ],
                    ),
                  ),

                 Padding(
                      padding: const EdgeInsets.fromLTRB(0,10.0,0,10),
                      child: InkWell(
                        onTap:(){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Container(
                          height:size.width<480? size.height*.065:size.height*.12,
                          width: size.width<480?size.width*.6:size.width*.35,
                          decoration: BoxDecoration(
                              color:  Colors.white,
                              border: Border.all(color: Colors.amber,width: 3),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text("Log In To Your Account",style: blackstyle,),
                          ),
                        ),
                      ),
                    ),

                ],
              ),
            ),

          ),
        ),
      ],
    );
  }
}