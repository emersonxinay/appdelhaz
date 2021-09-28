import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/utils/shared_pref.dart';
class ClientProductsListController {
  
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  Future init(BuildContext context) async{
    this.context = context;
  }
  void logout(){
    _sharedPref.logout(context);
  }

  void openDrawer(){
    key.currentState.openDrawer();
  }

}