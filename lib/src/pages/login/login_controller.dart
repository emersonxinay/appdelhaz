
import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/models/response_api.dart';
import 'package:proyectos_flutter/src/models/user.dart';
import 'package:proyectos_flutter/src/provider/users_provider.dart';
import 'package:proyectos_flutter/src/utils/my_snackbar.dart';
import 'package:proyectos_flutter/src/utils/shared_pref.dart';

class LoginController  {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async {
    this.context =context;
    await usersProvider.init(context);
  }
  void goToRegister(){
    Navigator.pushNamed(context, 'register');
  }
  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson()); //almancena en el dispositivo al usuario
    }
    else {
      MySnackbar.show(context, responseApi.message);
    }

    

  }
}
