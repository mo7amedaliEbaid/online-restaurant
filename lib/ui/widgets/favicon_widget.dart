import 'package:ecommerce_sqflite/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../models/meal_model.dart';

Widget FavouriteIcon(
    BuildContext context, AppController controller, MealModel meal) {
  return GetBuilder<AppController>(builder: (_) {
    return GestureDetector(
      onTap: () async {
        controller.setToFav(meal.id, !meal.fav);
        var result = await controller.addToFav(meal);
        bool isAdded = controller.isAlreadyInFavLIST(meal.id);
        isAdded ? controller.removeFromFav(meal.id) : result;
        controller.getFavList();
        var msg = "";
        if (meal.fav) {
          msg = "${meal.name} marked as favourite";
        } else {
          msg = "${meal.name} removed from favourite";
        }
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msg)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: meal.fav
            ? Icon(
                Icons.favorite,
                size: 20.0,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border,
                size: 20.0,
              ),
      ),
    );
  });
}
