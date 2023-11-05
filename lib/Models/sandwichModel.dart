class Meal {
  Meal(
      {required this.name,
      required this.image,
      this.extras,
      this.types,
      this.price,
      this.totalPrice,
      this.numberOfPurchased = 0});
  String name;
  String image;
  double? price;
  int numberOfPurchased = 0;
  double ?totalPrice;
  List<Extra>? extras;
  List<Type>? types;
  factory Meal.fromFB(dynamic data) {
    return Meal(
        name: data['name'],
        price: data["price"],
        image: data['image'],
        extras: data['Extras'] != null
            ? List<Extra>.from(
                data["Extras"].map((extra) => Extra.fromFb(extra)))
            : null,
        types: data["types"] != null
            ? List<Type>.from(data["types"].map((x) => Type.fromFB(x)))
            : null);
  }
}

class Type {
  double price;
  String typeName;
  int numberOfPurchased;
  double ?totalPrice;
  Type(
      {required this.price,
      required this.typeName,
      this.totalPrice,
      this.numberOfPurchased = 0});
  factory Type.fromFB(Map<String, dynamic> data) {
    return Type(price: data["price"], typeName: data["typeName"]);
  }
}

class Extra {
  String name;
  bool isChoosen = false;
  Extra({required this.name});
  factory Extra.fromFb(String name) {
    return Extra(name: name);
  }
}
