import '../Helpers/exportClass.dart';
import "../models/category.dart";

class Categorias extends StatelessWidget {
  Categorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Categorias"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, "home"),
          )),
      body: getcategorie(context, listCategories("")));  
  }
}
Widget getcategorie(BuildContext context, Future<List<Categorys>> futurecategorie) {
          return FutureBuilder(
      future: futurecategorie,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text("error: ${snapshot.error}"),
                ),
              );
            }
            return (snapshot.data != null)
                ? categorieList(snapshot.data)
                : Container(
                    alignment: Alignment.center,
                    child: const Center(child: Text("Sin datos")),
                  );
          default:
            return Text("recarga la pantalla");
        }
      });
}

Widget categorieList(List<Categorys> categorie) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: GridView.builder(
        itemCount: categorie.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: GestureDetector(
              onTap: () {
               
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    categorie[index].image!,
                    height: 150,
                    width: 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(categorie[index].name),
                      FloatingActionButton(
                          hoverColor: Colors.red,
                          onPressed: ()  {
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
                          child: const Icon(Icons.shop_2)),
                    ],
                  )
                ],
              ),
            ),
          );
        })),
  );
}