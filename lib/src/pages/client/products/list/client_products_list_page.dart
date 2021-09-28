import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:proyectos_flutter/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:proyectos_flutter/src/utils/my_colors.dart';
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
      key: _con.key,
      appBar: AppBar(
      leading: _menuDrawer(),
      ),
      drawer: _drawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar Sesión'),
        ),//imprime el texto en la pantalla
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
          title: Text('Editar Perfil'),
          trailing: Icon(Icons.edit_outlined), //trailing es para posiconar a la derecha y leading para la izquierda
        ),
        ListTile(
          title: Text('Mis Pedidos'),
          trailing: Icon(Icons.shopping_cart_outlined), //trailing es para posiconar a la derecha y leading para la izquierda
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