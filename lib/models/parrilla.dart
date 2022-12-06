class Parrilla {
  var id;
  var name;
  var price;
  var image;
  var category;
  Parrilla({this.id, this.name, this.price, this.image, this.category});

  factory Parrilla.fromJson(Map<String, dynamic> json) {
    return Parrilla(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"]);
  }
}
