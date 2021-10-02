import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
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
  PickedFile pickedFile;
  File imageFile;
  Function refresh;

  ProgressDialog _progressDialog;
  bool isEnable = true;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    usersProvider.init(context);
    _progressDialog = ProgressDialog(context: context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(context, 'Ingresar todos los campos');
      return;
    }
    if (confirmPassword != password) {
      MySnackbar.show(context, 'no coinciden las contraseñas');
      return;
    }

    if (password.length < 6) {
      MySnackbar.show(context, 'minimo 6 carecteres');
      return;
    }

    //si el usuario no selecciona ninguna imagen se le pedira que lo haga
    if (imageFile == null) {
      MySnackbar.show(context, 'Selecciona una imagen');
      return;
    }
    _progressDialog.show(max: 100, msg: 'Espere un Momento');
    isEnable = false;
    User user = new User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password);

    Stream stream = await usersProvider.createWithImage(user, imageFile);
    stream.listen((res) {
      _progressDialog.close();
      //ResponseApi responseApi = await usersProvider.create(user);
      ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
      print('Respuesta: ${responseApi.toJson()}');
      MySnackbar.show(context, responseApi.message);

      if (responseApi.success) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, 'login');
        });
      } else {
        isEnable = true;
      }
    });
  }

  Future selectImage(ImageSource imageSource) async {
    pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    Navigator.pop(context);
    refresh();
  }

  void showAlertDialog() {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.gallery);
        },
        child: Text('Galeria'));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          selectImage(ImageSource.camera);
        },
        child: Text('Camara'));
    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona tu imagen'),
      actions: [galleryButton, cameraButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void back() {
    Navigator.pop(context); //metodo para regresar atras
  }
}
