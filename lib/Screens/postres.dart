import '../Helpers/exportClass.dart';
import 'package:http/http.dart ' as http;

// ignore: camel_case_types
class Postres extends StatelessWidget {
  const Postres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Postres"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, "categorias"),
          ),
        ),
        backgroundColor: Colors.orange,
        body: getPostre(context, listPostres()));
  }
}

Widget getPostre(BuildContext context, Future<List<Postre>> futurepostre) {
  return FutureBuilder(
      future: futurepostre,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
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
                ? postreList(snapshot.data,context)
                : Container(
                    alignment: Alignment.center,
                    child: const Center(child: Text("Sin datos")),
                  );
          default:
            return Text("recarga la pantalla");
        }
      });
}

Widget postreList(List<Postre> postre,BuildContext context) {
   return Container(
             padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: postre.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
                crossAxisSpacing: 10,
                mainAxisSpacing: 2
                ), 
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.all(5),
                  padding: const EdgeInsets.all(1),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0x000005cc),
                        blurRadius: 30,
                        offset: Offset(10,10)
                      )
                    ]
                  ),
                  child: Column(
                  children: [
                    Image.network(postre[index].image, height: 200, width: 210,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(postre[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("S/${postre[index].price}", style: const TextStyle(fontSize: 16),),

                      ),
                      FloatingActionButton(
                        onPressed: () {
                          
                        },
                        child: const Icon(Icons.add_shopping_cart),
                      )
                        ],
                    ),
                    

                  ],
                )
                );
              } 
              ), 
          );
}
