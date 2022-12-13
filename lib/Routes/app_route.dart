import 'package:ejemplo3/Helpers/exportClass.dart';
import "../Screens/inicio.dart";
import '../Screens/categorias.dart';

class AppRouters {
  static const rutaHome = "home";
  static Map<String, Widget Function(BuildContext)> routes = {
    "home": (BuildContext context) => Inicio(),
    "perfil": (BuildContext context) => Perfil(),
    "Criolla": (BuildContext context) => const Criollos(),
    "Parrilla": (BuildContext context) => const Parrillas(),
    "Postres": (BuildContext context) => const Postres(),
    "Entradas": (BuildContext context) => const Entrada(),
    "Tragos": (BuildContext context) => const Trago(),
    "categorias": (BuildContext context) => Categorias(),
    "Marina": (BuildContext context) => const Marina()
  };
}
