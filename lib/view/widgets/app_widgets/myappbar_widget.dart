import 'package:ecommerce_sqflite/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_consts.dart';
import '../../../controller/app_controller.dart';
import '../../screens/cart_screen.dart';
import '../../screens/favourites_screen.dart';
import '../../screens/home_screen.dart';

PreferredSizeWidget MyAppBar(BuildContext context, AppController controller,
    bool iscarticon, bool isfavicon, String title) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    title: Text(
      title,
      style: bigwhiteindie,
    ),
    centerTitle: true,
    backgroundColor: appbarcolor,
    elevation: 0.0,
    leading: !isfavicon
        ? HomeIcon(context)
        : Container(
            margin: size.width < 480
                ? EdgeInsets.symmetric(horizontal: 10)
                : EdgeInsets.symmetric(horizontal: 20),
            child: InkResponse(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteScreen()));
                },
                child: Stack(
                  children: [
                    GetBuilder<AppController>(
                        builder: (_) => Align(
                              child: Text(controller.favmeals.length > 0
                                  ? controller.favmeals.length.toString()
                                  : ''),
                              alignment: Alignment.topLeft,
                            )),
                    Align(
                      child: Icon(Icons.favorite),
                      alignment: Alignment.center,
                    ),
                  ],
                )),
          ),
    actions: <Widget>[
      !iscarticon
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: HomeIcon(context),
            )
          : Padding(
              padding: size.width < 480
                  ? EdgeInsets.symmetric(horizontal: 10)
                  : EdgeInsets.symmetric(horizontal: 50),
              child: InkResponse(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  child: Stack(
                    children: [
                      GetBuilder<AppController>(
                          builder: (_) => Align(
                                child: Text(controller.cartmeals.length > 0
                                    ? controller.cartmeals.length.toString()
                                    : ''),
                                alignment: Alignment.topLeft,
                              )),
                      Align(
                        child: Icon(Icons.shopping_cart),
                        alignment: Alignment.center,
                      ),
                    ],
                  )),
            ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            await preferences.clear();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SplashScreen()));
          },
          child: Icon(Icons.logout),
        ),
      )
    ],
  );
}

Widget HomeIcon(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    },
    child: Icon(
      Icons.home_filled,
    ),
  );
}
