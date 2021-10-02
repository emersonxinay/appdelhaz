import 'package:flutter/material.dart';
import 'package:proyectos_flutter/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:proyectos_flutter/src/pages/client/products/list/client_products_list_page.dart';
import 'package:proyectos_flutter/src/pages/login/login_page.dart';
import 'package:proyectos_flutter/src/pages/register/register_page.dart';
import 'package:proyectos_flutter/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:proyectos_flutter/src/pages/roles/roles_page.dart';
import 'package:proyectos_flutter/src/utils/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

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
        //rutas para las paginas
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'roles': (BuildContext context) => RolesPage(),
        'client/products/list': (BuildContext context) =>
            ClientProductsLitsPage(),
        'restaurant/orders/list': (BuildContext context) =>
            RestaurantOrdersListPage(),
        'delivery/orders/list': (BuildContext context) =>
            DeliveryOrdersListPage(),
      },
      theme:
          ThemeData(fontFamily: 'Roboto', primaryColor: MyColors.primaryColor),
    );
  }
}
