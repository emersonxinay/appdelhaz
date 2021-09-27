import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:proyectos_flutter/src/pages/login/client/products/list/client_products_list_controller.dart';
class ClientProductsLitsPage extends StatefulWidget {
  const ClientProductsLitsPage({ Key key }) : super(key: key);

  @override
  _ClientProductsLitsPageState createState() => _ClientProductsLitsPageState();
}

class _ClientProductsLitsPageState extends State<ClientProductsLitsPage> {

  ClientProductsListController _con = new ClientProductsListController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar Sesión'),
        ),//imprime el texto en la pantalla
      ),
      
    );
  }
}