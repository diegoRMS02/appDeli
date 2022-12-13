import '../Helpers/exportClass.dart';
import 'package:http/http.dart ' as http;

// ignore: camel_case_types
class Parrillas extends StatelessWidget {
  const Parrillas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Parrilla"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, "categorias"),
          ),
        ),
        backgroundColor: Colors.orange,
        body: getParrilla(context, listParrilla()));
  }
}

Widget getParrilla(
    BuildContext context, Future<List<Parrilla>> futureparrilla) {
  return FutureBuilder(
      future: futureparrilla,
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
                ? parrillaList(snapshot.data)
                : Container(
                    alignment: Alignment.center,
                    child: const Center(child: Text("Sin datos")),
                  );
          default:
            return Text("recarga la pantalla");
        }
      });
}

Widget parrillaList(List<Parrilla> parrilla) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: GridView.builder(
        itemCount: parrilla.length,
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
                  Image.asset(
                    parrilla[index].image!,
                    height: 150,
                    width: 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(parrilla[index].name),
                      Text("${parrilla[index].price}"),
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
