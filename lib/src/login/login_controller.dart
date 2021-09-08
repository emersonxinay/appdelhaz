
import 'package:flutter/material.dart';

class LoginController  {
  BuildContext context;
  Future init(BuildContext context){
    this.context =context;
  }
  void goToRegister(){
    Navigator.pushNamed(context, 'register');
  }
}
