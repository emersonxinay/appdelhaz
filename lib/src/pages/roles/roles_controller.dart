import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/models/user.dart';
import 'package:proyectos_flutter/src/utils/shared_pref.dart';

class RolesController {
  BuildContext context;
  Function refresh;
  User user;
  SharedPref sharedPref = new SharedPref();

  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;
    //aqui se obtiene el usuario de sessión
    user = User.fromJson(await sharedPref.read('user'));
    refresh();
  }
  void goToPage(String route){
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}