
class Categorys {
  var id;
  var name;
  var image;
  Categorys({this.id, this.name, this.image});

  factory Categorys.fromJson(Map<String, dynamic> json){
    return  Categorys(
      id: json["_id"],
      name: json["name"],
      image: json["image"]);
  }
}

/* class Category {
  var id;
  var name;
  var image;
  Category({this.id, this.name, this.image} );

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json["_id"],
        name: json["name"],
        image: json["images"],
    );
  }
}

 */