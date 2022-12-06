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
                ? criolloList(snapshot.data)
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
Widget criolloList(List<Criollo> criollo) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: GridView.builder(
        itemCount: criollo.length,
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
                print('ok');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.network(
                    criollo[index].image!,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(criollo[index].name),
                      Text("${criollo[index].price}"),
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