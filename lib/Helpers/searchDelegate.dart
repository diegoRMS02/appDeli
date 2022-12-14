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
    if (query.trim().isEmpty) {
        return const Text("no hay valor ");
    }
    final serviceCa = SearchServiceNames();
    return FutureBuilder(
      future: serviceCa.getName(query),
      builder:(context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return _showListNames(snapshot.data);
        }else{
          return const Center(child: CircularProgressIndicator(strokeWidth: 4,),);
        }

      } ,
    );


  }

  @override
  Widget buildSuggestions(BuildContext context) {

     if (query.trim().isEmpty) {
        return const Text("");
    }
    final serviceCa = SearchServiceNames();
    return FutureBuilder(
      future: serviceCa.getName(query),
      builder:(context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return _showListNames(snapshot.data);
        }else{
          return const Center(child: CircularProgressIndicator(strokeWidth: 4,),);
        }

      } ,
    );
  }

}

Widget _showListNames(List<Categorys> categorie){
  return ListView.builder(
    itemCount: categorie.length,
    itemBuilder: (context, index) {
      final category = categorie[index];
      return 
      ListTile(
          leading: FadeInImage(
            image: NetworkImage(categorie[index].image),
            placeholder: const AssetImage("images/SpinnerImg.gif"),
          ),
          title: Text(categorie[index].name),
          subtitle: const Text("IR"),
          onTap: () {
           switch (categorie[index].name) {
                                  case "Marina":
                                    Navigator.pushNamed(context, "Marina");

                                    break;
                                  case "Criolla":
                                    Navigator.pushNamed(context, "Criolla");

                                    break;
                                  case "Parrilla":
                                    Navigator.pushNamed(context, "Parrilla");

                                    break;
                                  case "Postres":
                                    Navigator.pushNamed(context, "Postres");

                                    break;
                                  case "Entradas":
                                    Navigator.pushNamed(context, "Entradas");

                                    break;
                                  default:
                                    Navigator.pushNamed(context, "Tragos");
                                }
          },
        ); 
    }
  );
}