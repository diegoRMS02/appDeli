class Marino {
  var id;
  var name;
  var price;
  var image;
  var category;
  Marino({this.id, this.name, this.price, this.image, this.category});

  factory Marino.fromJson(Map<String, dynamic> json) {
    return Marino(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"]);
  }
}
