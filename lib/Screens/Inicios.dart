import 'package:ejemplo3/Helpers/searchDelegate.dart';

import '../Helpers/exportClass.dart';

class Inicios extends StatefulWidget {

  Inicios({super.key});

  @override
  State<Inicios> createState() => _IniciosState();
}

class _IniciosState extends State<Inicios>{

 final button = ["Promociones", "Descuento"];

  final menuOpciones = [
    "Perfil",
    "Categorias",
    "Carrito",
    "Favoritos",
    "Ayuda",
    "Configuracion",
    "Cerrar sesion"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*Barra lateral */
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("../assets/img/perfil.png")),
                    shape: BoxShape.circle,
                  )),
              const Text("usuario",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              ...menuOpciones.map(
                (e) => ListTile(
                  title: Text(e),
                  selectedColor: Colors.blueGrey[600],
                  onTap: () {
                    switch (e) {
                      case "Perfil":
                        Navigator.pushNamed(context, "perfil");

                        break;
                      case "Categorias":
                        Navigator.pushNamed(context, "categorias");

                        break;
                      case "Platillos":
                        Navigator.pushNamed(context, "platillos");

                        break;
                      default:
                        Navigator.pushNamed(context, "home");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Sazon Criolla"),
        actions: <Widget>[
          IconButton(onPressed: () {
            showSearch(context: context, delegate: SearchDeleguetaC());
          }, icon: const Icon(Icons.search))
        ],
      ),
      /*Menu inicio */
      body: 
       ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              /*Mensaje de beivenida de menu pricipal*/
              children: <Widget>[
                const Text(
                  "Bienvenido usuario",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  right: 20,
                )),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("../assets/img/perfil.png")),
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          swiper(),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...button.map(
                  (e) => TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red, primary: Colors.white),
                    onPressed: (() {
                      print("ok");
                    }),
                    child: Text(e, style: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: const [
                Text(
                  "Recomendaciones",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "../assets/img/postres.jpg",
                  fit: BoxFit.fill,
                  height: 150,
                  width: 200,
                ),
                const Padding(padding: EdgeInsets.only(right: 10)),
                Image.asset(
                  "../assets/img/ceviche2.jpg",
                  fit: BoxFit.fill,
                  height: 150,
                  width: 200,
                )
              ],
            ),
          )
        ],
      ), 

    );
  }
}

Widget swiper() {
  return Container(
    width: 50,
    height: 150.0,
    margin: const EdgeInsets.only(left: 60, right: 60),
    child: Swiper(
      viewportFraction: 0.8,
      scale: 0.9,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          swipe[index].images,
          fit: BoxFit.fill,
        );
      },
      itemCount: 5,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
    ),
  );
}



