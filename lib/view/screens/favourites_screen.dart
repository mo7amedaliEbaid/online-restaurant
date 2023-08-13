import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:ecommerce_sqflite/controller/app_controller.dart';
import 'package:ecommerce_sqflite/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/app_widgets/myappbar_widget.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Scaffold(
      backgroundColor: scafoldcolor,
      appBar: MyAppBar(context, controller, true, false, "Favourites"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<AppController>(
                builder: (_) {
                  if (controller.favmeals.length == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Center(
                        child: Text("No items found"),
                      ),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: controller.favmeals
                        .map((d) => generatefav(context, d))
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget generatefav(BuildContext context, MealModel d) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1.0),
              top: BorderSide(color: Colors.grey.shade200, width: 1.0),
            )),
        height: size.width < 480 ? size.height * .18 : size.height * .3,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 150.0,
              width: 200.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.white24, blurRadius: 5.0)
                  ],
                  image: DecorationImage(
                      image: AssetImage(d.image),
                      fit: size.width < 480
                          ? BoxFit.fitHeight
                          : BoxFit.fitWidth)),
            ),
            Expanded(
                child: Padding(
              padding: size.width < 480
                  ? EdgeInsets.only(top: 30.0, left: 15.0)
                  : EdgeInsets.only(top: 30.0, left: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          d.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: InkResponse(
                          onTap: () {
                            Get.find<AppController>()
                                .removeFromFav(d.shopId ?? 0);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Item removed from fsvourites successfully")));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Price ${d.price.toString()}"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
