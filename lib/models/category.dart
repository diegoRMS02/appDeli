
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
class Categories{
  var name;
  var image;
  Categories(this.name,this.image);
}

final categoriess = [
  Categories('Marina', '../assets/img/marina.jfif'),
  Categories('Criolla', '../assets/img/criolla.jpg'),
  Categories('Parrilla', '../assets/img/pariila2.jfif'),
  Categories('Postres', '../assets/img/postres3.jpg'),
  Categories('Entradas', '../assets/img/entrada.jpeg'),
  Categories('Tragos', '../assets/img/tragos.jpg'),

];
 
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