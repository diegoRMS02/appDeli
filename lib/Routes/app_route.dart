import 'package:ejemplo3/Helpers/exportClass.dart';
import "../Screens/inicio.dart";
import '../Screens/categorias.dart';

class AppRouters {
  static const rutaHome = "home";
  static Map<String, Widget Function(BuildContext)> routes = {
    "home": (BuildContext context) => Inicio(),
    "perfil": (BuildContext context) => Perfil(),
    "criollos": (BuildContext context) => const Criollos(),
    "parrilla": (BuildContext context) => const Parrillas(),
    "postres": (BuildContext context) => const Postres(),
    "entradas": (BuildContext context) => const Entrada(),
    "tragos": (BuildContext context) => const Trago(),
    "categorias": (BuildContext context) => Categorias(),
    "marina": (BuildContext context) => const Marina()
  };
}
