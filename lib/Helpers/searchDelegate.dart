import 'package:ejemplo3/Helpers/exportClass.dart';
import 'package:ejemplo3/models/category.dart';

class SearchDeleguetaC extends SearchDelegate{
  List<String> searchItems =[
    "Marina","Criolla","Parrilla","Postres","Entradas","Tragos"

  ];
  List<String> Screen = [

    "perfil",
    "criollos",
    "parrilla",
    "postres",
    "entradas",
    "tragos",
    "marina"

  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
      onPressed: (){
        query = "";
      }, 
      icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){close(context, Categorys() );}
      , icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> filter = [];
    for (var category in searchItems) {
      if (category.toLowerCase().contains(query.toLowerCase())) {
        filter.add(category);
      }
    }
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
  List<String> filter = [];
    for (var category in searchItems) {
      if (category.toLowerCase().contains(query.toLowerCase())) {
        filter.add(category);
      }
    }
    return Container();
  }

}