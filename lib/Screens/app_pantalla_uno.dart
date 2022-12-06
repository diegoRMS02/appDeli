import '../Helpers/exportClass.dart';

class PantallaUno extends StatelessWidget {
  const PantallaUno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("Pantalla 1"),
        ),
        body: ListView(
          children: [
            Card(
              child: Column(children: [
                const ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Esta sera una tarjeta"),
                  subtitle: Text("lorem "),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "home");
                            },
                            child: const Text("home"),
                          )
                        ]))
              ]),
            )
          ],
        ));
    Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(Icons.star),
          title: Text("Esta sera una tarjeta"),
          subtitle: Text("lorem "),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "home");
                },
                child: const Text("home"),
              )
            ]))
      ]),
    );
  }
}
