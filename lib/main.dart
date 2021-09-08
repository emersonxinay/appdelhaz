import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/login/login_page.dart';
import 'package:proyectos_flutter/src/register/register_page.dart';
import 'package:proyectos_flutter/src/utils/my_colors.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery Hazuki',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
      },
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: MyColors.primaryColor
      ),
    );
  }
}