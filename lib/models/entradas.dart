class Entradas {
  var id;
  var name;
  var price;
  var image;
  var category;
  Entradas({this.id, this.name, this.price, this.image, this.category});

  factory Entradas.fromJson(Map<String, dynamic> json) {
    return Entradas(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        category: json["category"]);
  }
}
