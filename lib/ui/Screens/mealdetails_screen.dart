import 'package:ecommerce_sqflite/constants/global_consts.dart';
import 'package:ecommerce_sqflite/controller/app_controller.dart';
import 'package:ecommerce_sqflite/models/meal_model.dart';
import 'package:ecommerce_sqflite/ui/widgets/bottombar_widget.dart';
import 'package:ecommerce_sqflite/ui/widgets/favicon_widget.dart';
import 'package:ecommerce_sqflite/ui/widgets/mealdescription_widget.dart';
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
      body: size.width < 480
          ? Column(
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: size.height * .27,
                                  width: size.width * .6,
                                  child: PageView.builder(
                                      controller: pageController,
                                      onPageChanged: (index) {
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
                                child:
                                    FavouriteIcon(context, controller, meal)));
                      })
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: size.width,
                  color: Colors.black,
                ),
                MealsDescription(context, meal),
              ],
            )
          : Container(
              color: Colors.white,
              height: size.height * .6,
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: <Widget>[
                        Container(
                            height: size.height * .4,
                            width: size.width * .3,
                            child: PageView.builder(
                                controller: pageController,
                                onPageChanged: (index) {
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
                          height: size.height * .005,
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ...AppConstants.dotsindex
                                .map((e) => DotsIndicator(active, e)),
                            GetBuilder<AppController>(builder: (value) {
                              return Container(
                                height: 20.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: FavouriteIcon(context, controller, meal),
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                    MealsDescription(context, meal)
                  ]),
            ),
      bottomNavigationBar: BottomBar(context, controller, meal),
    );
  }
}
