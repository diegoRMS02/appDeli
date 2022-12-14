import '../Helpers/exportClass.dart';
import 'package:http/http.dart ' as http;

// ignore: camel_case_types
class Criollos extends StatelessWidget {
  const Criollos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Comida Criolla"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, "categorias"),
          ),
        ),
        backgroundColor: Colors.orange,
        body: getCriollo(context, listCriollo()));
  }
}

//obtine los datos del service
Widget getCriollo(BuildContext context, Future<List<Criollo>> futureCriollo) {
  return FutureBuilder(
      future: futureCriollo,
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
                ? criolloList(snapshot.data, context)
                : Container(
                    alignment: Alignment.center,
                    child: const Center(child: Text("Sin datos")),
                  );
          default:
            return Text("recarga la pantalla");
        }
      });
}

//pinta los datos en la pantalla
Widget criolloList(List<Criollo> criollo, BuildContext context) {
  return Container(
             padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: criollo.length,
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
                    Image.network(criollo[index].image, height: 200, width: 210,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(criollo[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("S/${criollo[index].price}", style: const TextStyle(fontSize: 16),),

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


/* // ignore: camel_case_types
class platillos extends StatelessWidget {
  const platillos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comida Criolla"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, "home"),
        ),
      ),
      backgroundColor: Colors.orange,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: null
      ),
    );
  }
}
 */
/*
GridView.builder(
            itemCount: Menu.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: GestureDetector(
                  onTap: () {
                    print('ok');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.network(
                        Menu[index].images,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(Menu[index].nombre),
                          FloatingActionButton(
                              hoverColor: Colors.red,
                              onPressed: () {
                                print('ok');
                              },
                              child: const Icon(Icons.shop_2)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            })),
 */