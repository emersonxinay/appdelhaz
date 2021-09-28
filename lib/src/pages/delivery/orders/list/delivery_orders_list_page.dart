import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:proyectos_flutter/src/pages/delivery/orders/list/delivery_orders_list_controller.dart';
import 'package:proyectos_flutter/src/utils/my_colors.dart';
class DeliveryOrdersListPage extends StatefulWidget {
  const DeliveryOrdersListPage({ Key key }) : super(key: key);

  @override
  _DeliveryOrdersListPageState createState() => _DeliveryOrdersListPageState();
}

class _DeliveryOrdersListPageState extends State<DeliveryOrdersListPage> {

  DeliveryOrdersListController _con = new DeliveryOrdersListController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        leading: _menuDrawer(),
      ),
      drawer: _drawer(),
      body: Center(
        child: Text('Lista de Pedidos del Restaurant'),
      ),
    );
  }
  Widget _menuDrawer(){
  return GestureDetector(
    onTap: _con.openDrawer,
    child: Container(
      margin: EdgeInsets.only(left: 15),
      alignment: Alignment.centerLeft,
      child: Image.asset('assets/img/menu.png', width: 20, height: 20),
    ),
  );
  
}
  Widget _drawer(){
  return Drawer(
    child: ListView( 
      padding: EdgeInsets.zero, //ListView es casi como una column la diferencia que ListView te deja hacer scroller ubir y bajar 
      children: [
        DrawerHeader( //barra del icono con los datos del usuario
          decoration: BoxDecoration(
            color: MyColors.primaryColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //colum sirve para poner elementos uno debajo de otro
            children: [
              Text(
                'nombre de usuario',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 1,
              ),
              Text(
                'email',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              
                maxLines: 1,
              ),
              Text(
                'Telefono',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              
                maxLines: 1,
              ),
              Container( //contiene la imagen del perfil
                margin: EdgeInsets.only(top: 10),
                height: 60,
                child: FadeInImage(
                  image: AssetImage('assets/img/no-image.png'),
                  fit: BoxFit.contain,
                  fadeInDuration: Duration(milliseconds: 50),
                  placeholder: AssetImage('assets/img/uno-image.png'),
                ),
              )
            ],
          )
        ),
        ListTile(
          title: Text('Seleccionar Rol'),
          trailing: Icon(Icons.person_outline), //trailing es para posiconar a la derecha y leading para la izquierda
        ),
        ListTile(
          onTap: _con.logout,
          title: Text('Cerrar Session'),
          trailing: Icon(Icons.power_settings_new), //trailing es para posiconar a la derecha y leading para la izquierda
        )
      ],
    ),
  );
}
}