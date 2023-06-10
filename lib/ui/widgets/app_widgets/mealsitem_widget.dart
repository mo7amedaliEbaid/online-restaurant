import 'package:flutter/material.dart';

import '../../../models/meal_model.dart';
import '../../Screens/mealdetails_screen.dart';

Widget MealItem(BuildContext context, MealModel meal) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: InkResponse(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MealDetailsScreen(mealId: meal.id)));
        },
        child: Material(
          child: Container(
              height: 380.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 8.0)
                  ]),
              child: Column(
                crossAxisAlignment: size.width<480?CrossAxisAlignment.start:CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(meal.image), fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${meal.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${meal.price.toString()}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Container(
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
                        )
                      ],
                    ),
                  )
                ],
              )),
        )),
  );
}
