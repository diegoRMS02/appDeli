class Tragos {
  var id;
  var name;
  var price;
  var image;
  var category;
  Tragos({this.id, this.name, this.price, this.image, this.category});

  factory Tragos.fromJson(Map<String, dynamic> json) {
    return Tragos(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"]);
  }
}
