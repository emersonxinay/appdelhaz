
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

    User user = User.fromJson(await _sharedPref.read('user') ?? {});  // los signos de interrogación son por si salen nulas los datos y evitar errores
    
    print('Usuario: ${user.toJson()}'); //para ver si el usuario se conecto.

    //esto nos ayuda a volver a la pagina que se dejo abierto como usuario logueado y no volver nuevamente a logearse.
    if (user?.sessionToken != null) { // el signo de interregación para evitar error
      if (user.roles.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      }
      else {
        Navigator.pushNamedAndRemoveUntil(context, user.roles[0].route, (route) => false);
      }

    }
  }
  void goToRegister(){
    Navigator.pushNamed(context, 'register');
  }
  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);

    //para imprimir en consola y saber lo que pasa 
    print('Respuesta object: ${responseApi}');
    print('Respuesta: ${responseApi.toJson()}');

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());  //almancena en el dispositivo al usuario
      
      print('Usuario Logueado: ${user.toJson()}');
      if (user.roles.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      }
      else {
        Navigator.pushNamedAndRemoveUntil(context, user.roles[0].route, (route) => false);
      }

       //nos lleva a una ruta mas especifica y borra todas las pantallas anteriores
    }
    else {
      MySnackbar.show(context, responseApi.message);
    }

    

  }
}
