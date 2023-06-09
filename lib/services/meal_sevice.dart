

import 'package:ecommerce_sqflite/models/meal_model.dart';
import 'package:ecommerce_sqflite/services/dbService.dart';
import 'package:ecommerce_sqflite/services/storageService.dart';


class MealServices {
  DbHandler dbHandler = DbHandler();
  StorageService storageService = StorageService();
  List<MealModel> mealsList = [];

  List<MealModel> getmeals() {
    int count = 1;
    mealsdata.forEach((element) {
      element['id'] = count;
      mealsList.add(MealModel.fromJson(element));
      count++;
    });
    return mealsList;
  }

  List<MealModel> get items => getmeals();

  Future openDB() async {
    return await dbHandler.openDB();
  }

  loadItems() async {
    bool isFirst = await isFirstTime();

    if (isFirst) {
      List items = await getLocalDBRecord();
      return items;
    } else {
      List items = await saveToLocalDB();
      return items;
    }
  }

  Future<bool> isFirstTime() async {
    return await storageService.getItem("isFirstTime") == 'true';
  }

  Future saveToLocalDB() async {
    List<MealModel> items = this.items;
    for (var i = 0; i < items.length; i++) {
      await dbHandler.saveRecord(items[i]);
    }
    storageService.setItem("isFirstTime", "true");
    return await getLocalDBRecord();
  }

  Future getLocalDBRecord() async {
    return await dbHandler.getItemsRecord();
  }

  Future setItemAsFavourite(id, flag) async {
    return await dbHandler.setItemAsFavourite(id, flag);
  }

  Future addToCart(MealModel mealsdata) async {
    return await dbHandler.addToCart(mealsdata);
  }

  Future getCartList() async {
    return await dbHandler.getCartList();
  }

  removeFromCart(int shopId) async {
    return await dbHandler.removeFromCart(shopId);
  }
}
