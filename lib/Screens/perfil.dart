import '../Helpers/exportClass.dart';

class Perfil extends StatelessWidget {
  final buttons = ['Metodos de pago', 'Direccion', 'Pedidos', 'Soporte'];
  Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, "home"),
        ),
        title: const Text("Perfil"),
      ),
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.all(20)),
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: Image.asset("../assets/img/perfil.png"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(left: 195),
            leading: Icon(Icons.account_circle),
            title: Text("Usuario"),
            subtitle: Text("lorem "),
          ),
          Column(
            children: [
              ...buttons.map((e) => ListTile(
                    contentPadding: const EdgeInsets.only(left: 100),
                    leading: const Icon(Icons.star),
                    title: Text(e),
                    onTap: () {
                      switch (e) {
                        case "Metodos de pago":
                          Navigator.pushNamed(context, 'home');

                          break;
                        case "direccion":
                          Navigator.pushNamed(context, "");

                          break;
                        case "pedidos":
                          Navigator.pushNamed(context, "");

                          break;
                        default:
                          Navigator.pushNamed(context, "");
                      }
                    },
                  ))
            ],
          )
        ],
      ),

      /* Column(children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: Image.asset("../assets/perfil.png"),
          ),
          const Padding(padding: EdgeInsets.only(right: 50, left: 50)),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Usuario"),
            subtitle: Text("lorem "),
          ),
          Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              margin: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "home");
                  },
                  child: const Text("home"),
                )
              ]))
        ]) ;*/
    );
  }
}
