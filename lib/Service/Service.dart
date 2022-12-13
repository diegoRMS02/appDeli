import 'dart:convert';
import '../Helpers/exportClass.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import "../models/category.dart";

//marino
Future<List<Marino>> ListMarino() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.105:4000/api/marino"));

  return compute(decodeJson, response.body);
}

List<Marino> decodeJson(String responseBody) {
  //Aqui se convierte el body de la respues ta un json
  final myJson = json.decode(responseBody);
  //aqui convertimos el json a un objeto tipo marino y lo retornamos en un lista
  return myJson["marino"].map<Marino>((json) => Marino.fromJson(json)).toList();
}

//Criollo
Future<List<Criollo>> listCriollo() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.105:4000/api/criollo"));

  return compute(decodeJson2, response.body);
}

List<Criollo> decodeJson2(String responseBody) {
  final myJson = json.decode(responseBody);

  return myJson["criollo"]
      .map<Criollo>((json) => Criollo.fromJson(json))
      .toList();
}

//Parrilla
Future<List<Parrilla>> listParrilla() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.105:4000/api/parrilla"));

  return compute(decodeJson3, response.body);
}

List<Parrilla> decodeJson3(String responseBody) {
  final myJson = json.decode(responseBody);

  return myJson["parrilla"]
      .map<Parrilla>((json) => Parrilla.fromJson(json))
      .toList();
}

//Postres
Future<List<Postre>> listPostres() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.105:4000/api/postres"));

  return compute(decodeJson4, response.body);
}

List<Postre> decodeJson4(String responseBody) {
  final myJson = json.decode(responseBody);

  return myJson["postres"]
      .map<Postre>((json) => Postre.fromJson(json))
      .toList();
}

//Entradas
Future<List<Entradas>> listEntradas() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.105:4000/api/entradas"));

  return compute(decodeJson5, response.body);
}

List<Entradas> decodeJson5(String responseBody) {
  final myJson = json.decode(responseBody);

  return myJson["entradas"]
      .map<Entradas>((json) => Entradas.fromJson(json))
      .toList();
}

//Tragos
Future<List<Tragos>> listTragos() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.105:4000/api/tragos"));

  return compute(decodeJson6, response.body);
}

List<Tragos> decodeJson6(String responseBody) {
  final myJson = json.decode(responseBody);

  return myJson["tragos"].map<Tragos>((json) => Tragos.fromJson(json)).toList();
}

//Categorias
Future<List<Categorys>> listCategories() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.105:4000/api/categorie"));

  return compute(decodeJson7, response.body);
}

List<Categorys> decodeJson7(String responseBody) {
  final myJson = json.decode(responseBody);

  return myJson["categorie"].map<Categorys>((json) => Categorys.fromJson(json)).toList();
}
