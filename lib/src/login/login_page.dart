
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:proyectos_flutter/src/login/login_controller.dart';
import 'package:proyectos_flutter/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('INIT STATE');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print('Scheduler Binding');
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    print('METODO BUILD');
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circleLogin()),
            Positioned(
              top: 60,
              left: 25,
              child: _textLogin()),
            Column(
              children: [
                //_imagenBanner(),
                _lottieAnimation(),
                _textFieldEmail(),
                _textFieldPassword(),
                _buttonRegistrarse(),
                _rowTextRegistrate(),   
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _circleLogin(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }
  Widget _textLogin(){
    return Text(
      'HAZUKI',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'NimbusSans'
        ),
    );
  }
  Widget _imagenBanner(){
    return Container(
      margin: EdgeInsets.only(
        top: 100, 
        bottom: MediaQuery.of(context).size.height * 0.22
        ),
      child: Image.asset(
                'assets/img/delivery.png',
                width: 200,
                height: 200,
                ),
    );
  }
  Widget _lottieAnimation(){
    return Container(
      margin: EdgeInsets.only(
        top: 150, 
        bottom: MediaQuery.of(context).size.height * 0.16
        ),
      child: Lottie.asset(
        'assets/json/delivery.json',
        width: 350,
        height: 200,
        fit: BoxFit.fill
        ),
    );
  }
  
  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
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
  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(
        color: MyColors.primryOpacityColor,
        borderRadius: BorderRadius.circular(30)
        ),
      child: TextField(
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
  Widget _buttonRegistrarse(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
                onPressed: () {}, 
                child: Text('Ingresar'),
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
  Widget _rowTextRegistrate(){
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No tienes Cuenta?',
                  style: TextStyle(
                    color: MyColors.primaryColor
                  ),
                  ),
                SizedBox(width: 9),
                GestureDetector(
                  onTap: _con.goToRegister,
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryColor
                    ),
                    ),
                ),
              ],
            );
  }
}