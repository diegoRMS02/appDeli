
class Categorys {
  var id;
  var image;
   var name;
  Categorys({this.id, this.image,this.name});

  factory Categorys.fromJson(Map<String, dynamic> json){
    return  Categorys(
      id: json["_id"],
      image: json["image"],
      name: json["name"]);
      
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