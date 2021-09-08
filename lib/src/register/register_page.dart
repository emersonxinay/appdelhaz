import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/utils/my_colors.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circleRegister()),
            Positioned(
              top: 70,
              left: 25,
              child: _textRegister()),
            Positioned(
              top: 55,
              left: -5,
              child: _iconBack()),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageUser(),
                    SizedBox(height: 30),
                    _textFieldEmail(),
                    _textFieldName(),
                    _textFieldLastName(),
                    _textFieldTelefono(),
                    _textFieldPassword(),
                    _textFieldPasswordConfirm(),
                    _buttonRegistrarse()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
  Widget _imageUser(){
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    );
  }
  Widget _iconBack(){
    return IconButton(
      onPressed: (){}, 
      icon: Icon(Icons.arrow_back_ios, color: Colors.white)
      );
  }
  Widget _textRegister(){
    return Text(
          'HAZUKI R',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'NimbusSans'
            ),
        );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primryOpacityColor,
        borderRadius: BorderRadius.circular(30)
        ),
      child: TextField(
                decoration: InputDecoration(
                  hintText: 'Correo Electronico',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
    );
  }
  Widget _textFieldName(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primryOpacityColor,
        borderRadius: BorderRadius.circular(30)
        ),
      child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
    );
  }
  Widget _textFieldLastName(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primryOpacityColor,
        borderRadius: BorderRadius.circular(30)
        ),
      child: TextField(
                decoration: InputDecoration(
                  hintText: 'Apellidos',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
    );
  }
  Widget _textFieldTelefono(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primryOpacityColor,
        borderRadius: BorderRadius.circular(30)
        ),
      child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Telefono',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
    );
  }
  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primryOpacityColor,
        borderRadius: BorderRadius.circular(30)
        ),
      child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
    );
  }
  Widget _textFieldPasswordConfirm(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primryOpacityColor,
        borderRadius: BorderRadius.circular(30)
        ),
      child: TextField(
                decoration: InputDecoration(
                  hintText: 'Confirmar Contraseña',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(
                    color: MyColors.primaryColorDark
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: MyColors.primaryColor,
                  )
                ),
              ),
    );
  }
  Widget _buttonRegistrarse(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
                onPressed: () {}, 
                child: Text('REGISTRARSE'),
                style: ElevatedButton.styleFrom(
                  primary: MyColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                    ),
                  padding: EdgeInsets.symmetric(
                    vertical: 15
                  )
                ),
              ),
    );
  }
  Widget _circleRegister(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }

}