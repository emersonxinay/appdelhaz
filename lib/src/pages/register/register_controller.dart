import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/models/response_api.dart';
import 'package:proyectos_flutter/src/models/user.dart';
import 'package:proyectos_flutter/src/provider/users_provider.dart';
import 'package:proyectos_flutter/src/utils/my_snackbar.dart';

class RegisterController {
  BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider(); 

  Future init(BuildContext context){
    this.context = context;
    usersProvider.init(context);
  }
  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty|| name.isEmpty || lastname.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      MySnackbar.show(context, 'Ingresar todos los campos');
      return;
    }
    if (confirmPassword != password ) {
      MySnackbar.show(context, 'no coinciden las contraseñas');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(context, 'minimo6 carecteres');
      return;
    }

    User user = new User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password

    );

    ResponseApi responseApi = await usersProvider.create(user);
    MySnackbar.show(context, responseApi.message);

    print('Respuesta: ${responseApi.toJson()}');
    print(email);
    print(name);
    print(lastname);
    print(phone);
    print(password);
    print(confirmPassword);

  }

}