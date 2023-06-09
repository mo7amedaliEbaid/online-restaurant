import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:ecommerce_sqflite/controller/app_controller.dart';
import 'package:ecommerce_sqflite/models/meal_model.dart';
import 'package:ecommerce_sqflite/ui/widgets/myappbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_consts.dart';
import '../widgets/mybutton_widget.dart';
import '../widgets/dotsindicator_widget.dart';

class MealDetailsScreen extends StatefulWidget {
  final int mealId;

  MealDetailsScreen({required this.mealId});

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late PageController pageController;
  int active = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.find<AppController>();
    MealModel meal = controller.getItem(widget.mealId);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldcolor,
      appBar: MyAppBar(context, controller),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey.shade200,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: size.width * .1,
                  right: size.width * .1,
                  child: Container(
                    height: size.height * .37,
                    padding: EdgeInsets.only(top: 10.0),
                    //color: scafoldcolor,
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: size.height * .27,
                            width: size.width * .6,
                            child: PageView.builder(
                                controller: pageController,
                                onPageChanged: (index) {
                                  print(index);
                                  setState(() {
                                    active = index;
                                  });
                                },
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Image.asset(
                                    meal.image,
                                    fit: BoxFit.fill,
                                  );
                                })),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ...AppConstants.dotsindex
                                .map((e) => DotsIndicator(active, e))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GetBuilder<AppController>(builder: (value) {
                  return Container(
                      height: 270.0,
                      alignment: Alignment(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Column(
                          verticalDirection: VerticalDirection.down,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                controller.setToFav(meal.id, !meal.fav);
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
                            )
                          ],
                        ),
                      ));
                })
              ],
            ),
          ),
          Container(
            height: 1,
            width: size.width,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  meal.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                      "${meal.name}: meal fried meat smoked delicious meal for family and friend dont passed shrimp donuts sweet tomato wine coconuts for each meal drink food"),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
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
                        style: blackstyle,
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
          )),
    );
  }
}
