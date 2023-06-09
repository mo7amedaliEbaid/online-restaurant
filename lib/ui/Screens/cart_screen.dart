
import 'package:ecommerce_sqflite/controller/app_controller.dart';
import 'package:ecommerce_sqflite/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget {
  Widget generateCart(BuildContext context, MealModel d) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade100, width: 1.0),
              top: BorderSide(color: Colors.grey.shade100, width: 1.0),
            )),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage(d.image), fit: BoxFit.fitHeight)),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
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
                                    .removeFromCart(d.shopId ?? 0);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Item removed from cart successfully")));
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


  getItemTotal(List<MealModel> items) {
    double sum = 0.0;
    items.forEach((e){sum += e.price;});
    return "\$$sum";
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart list"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<AppController>(
                builder: (_) {
                  if (controller.cartmeals.length == 0) {
                    return Center(
                      child: Text("No item found"),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: controller.cartmeals
                        .map((d) => generateCart(context, d))
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: GetBuilder<AppController>(
                    builder: (_) {
                      return RichText(
                        text: TextSpan(
                            text: "Total  ",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: getItemTotal(controller.cartmeals).toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold)
                              )
                            ]
                        ),
                      );
                    },
                  )
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                color: Colors.white,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      child: Text("Checkout", style: TextStyle(fontSize: 18),),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
