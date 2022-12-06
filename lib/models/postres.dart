class Postre {
  var id;
  var name;
  var price;
  var image;
  var category;
  Postre({this.id, this.name, this.price, this.image, this.category});

  factory Postre.fromJson(Map<String, dynamic> json) {
    return Postre(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"]);
  }
}
