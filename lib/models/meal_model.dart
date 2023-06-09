var mealsdata = [
  {
    "name": "Burger",
    "price": 25.0,
    "fav": false,
    "rating": 4.5,
    "image":
    "assets/meals/burger.jpg"
  },
  {
    "name": "Grilled Meat",
    "price": 50.0,
    "fav": false,
    "rating": 4.5,
    "image":
    "assets/meals/grilled_meat.jpg"
  },
  {
    "name": "Kebab",
    "price": 40.0,
    "fav": false,
    "rating": 4.5,
    "image":
    "assets/meals/kebab.jpg"
  },
  {
    "name": "Shrimp",
    "price": 30.0,
    "fav": false,
    "rating": 3.5,
    "image":
    "assets/meals/shrimp.jpg"
  },
  {
    "name": "Snacks",
    "price": 15.0,
    "fav": false,
    "rating": 4.5,
    "image":
    "assets/meals/snacks.jpg"
  },
  {
    "name": "Soused Chicken",
    "price": 45.0,
    "fav": false,
    "rating": 4.0,
    "image":
    "assets/meals/sousedchicken.jpg"
  },
  {
    "name": "Special Launch",
    "price": 70.0,
    "fav": false,
    "rating": 4.0,
    "image":
    "assets/meals/special_launch.jpg"
  },
  {
    "name": "Sweet Donuts",
    "price": 27.0,
    "fav": false,
    "rating": 4.9,
    "image":
    "assets/meals/sweet_donuts.jpg"
  }
];

class MealModel {
  String name;
  double price;
  bool fav;
  double rating;
  String image;
  int id;
  int? shopId;

  MealModel(
      {this.shopId,
        required this.id,
        required this.fav,
        required this.rating,
        required this.price,
        required this.image,
        required this.name});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      shopId: json['shop_id'] ?? 0,
    );
  }
}
