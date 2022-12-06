class Criollo {
  var id;
  var name;
  var price;
  var image;
  var category;
  Criollo({this.id, this.name, this.price, this.image, this.category});

  factory Criollo.fromJson(Map<String, dynamic> json) {
    return Criollo(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"]);
  }
}
