import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/utils/shared_pref.dart';
class ClientProductsListController {
  
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context){
    this.context = context;
  }
  logout(){
    _sharedPref.logout(context);
  }

}