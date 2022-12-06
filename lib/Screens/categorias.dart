import '../Helpers/exportClass.dart';

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
      body: Container(
        margin: const EdgeInsets.all(20),
        child: GridView.builder(
            itemCount: Car.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[300]),
                child: GestureDetector(
                  onTap: () {
                    print('ok');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.network(
                        Car[index].images,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(Car[index].nombre),
                          FloatingActionButton(
                              heroTag: "next",
                              hoverColor: Colors.red,
                              onPressed: () {
                                switch (Car[index].nombre) {
                                  case "Marina":
                                    Navigator.pushNamed(context, "marina");

                                    break;
                                  case "Criolla":
                                    Navigator.pushNamed(context, "criollos");

                                    break;
                                  case "Parrilla":
                                    Navigator.pushNamed(context, "parrilla");

                                    break;
                                  case "Postres":
                                    Navigator.pushNamed(context, "postres");

                                    break;
                                  case "Entradas":
                                    Navigator.pushNamed(context, "entradas");

                                    break;
                                  default:
                                    Navigator.pushNamed(context, "tragos");
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
      ),

/*       ListView(
        children: [
          ...images.map((e) => Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset(e),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Text('pipip')
                ],
              )),
        ],
      ), */
    );
  }
}
