import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  //metodo para guardar datos 
  void save(String key, value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
//metodo para leer la información almacenada
Future<dynamic> read(String key) async{
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString(key) == null) 
    return null; 
    return json.decode(prefs.getString(key));
}
// metodo para saber si existe algun dato de shared preferences
Future<bool> contains(String key) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(key);
}
// metodo para eliminar un dato de shared preferences 
Future<bool> remove(String key) async{
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove(key);
}

}