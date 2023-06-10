

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
