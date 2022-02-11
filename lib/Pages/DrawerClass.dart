import 'package:flutter/material.dart';
import 'package:robots/Pages/ListaAlertasSuscritas.dart';
import 'package:robots/Pages/LoginPage.dart';

class DrawerClass extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(child:
                  Image.asset('assets/images/WASolutions.png')
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.wysiwyg),
              title: Text('Listado de Alertas'),
              onTap: (){
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                    new ListaAlertasSuscritas(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_alert_outlined),
              title: Text('Activar Alertas'),
              onTap: (){} ,
            ),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.exit_to_app),
                            title: Text('Cerrar Sesión'),
                            onTap: (){
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                  new LoginPage(),
                                ),
                              );
                            }
                        ),
                      ],
                    ))),
          ],
        ),
      );
  }
}
