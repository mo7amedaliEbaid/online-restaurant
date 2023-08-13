import 'package:ecommerce_sqflite/controller/app_controller.dart';
import 'package:ecommerce_sqflite/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../constants/global_consts.dart';
import 'mybutton_widgets.dart';
Widget BottomBar(BuildContext context,AppController controller,MealModel meal){
  Size size=MediaQuery.of(context).size;
  return Container(
      margin: EdgeInsets.only(bottom: 18.0),
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: size.width * .2,
                  child: Text(
                    "Total Amount",
                    style: blackindiestyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Text("\$${meal.price.toString()}", style: deepstyle),
              ],
            ),
          ),
          GetBuilder<AppController>(builder: (_) {
            bool isAdded = controller.isAlreadyInCart(meal.id);
            if (isAdded) {
              return MyButton(
                name: "REMOVE CART",
                onTap: () async {
                  try {
                    controller.removeFromCart(meal.id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                        Text("Item removed from cart successfully")));
                  } catch (e) {
                    print(e);
                  }
                },
              );
            }
            return MyButton(
              name: "ADD TO CART",
              onTap: controller.isLoading
                  ? null
                  : () async {
                try {
                  var result = await controller.addToCart(meal);
                  controller.getCardList();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                      Text("Item added in cart successfully")));
                } catch (e) {
                  print(e);
                }
              },
            );
          })
        ],
      ));
}