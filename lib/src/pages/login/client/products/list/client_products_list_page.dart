import 'package:flutter/material.dart';
class ClientProductsLitsPage extends StatefulWidget {
  const ClientProductsLitsPage({ Key key }) : super(key: key);

  @override
  _ClientProductsLitsPageState createState() => _ClientProductsLitsPageState();
}

class _ClientProductsLitsPageState extends State<ClientProductsLitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Lista de productos'),//imprime el texto en la pantalla
      ),
      
    );
  }
}