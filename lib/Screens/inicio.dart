import 'package:ejemplo3/Screens/Inicios.dart';
import 'package:ejemplo3/Screens/categorias.dart';
import 'package:ejemplo3/models/category.dart';

import '../Helpers/exportClass.dart';


class Inicio extends StatefulWidget {

  Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int select_page = 0;
  List<Widget> pages = [
    Inicios(),
    Categorias(),
    ScreenCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[select_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 2) {
            
          }
          setState(() {
            select_page = index;
          });
        },
        currentIndex: select_page,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categorias"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Carrito"),
        ]
        ),
    );
  }
}
