import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:robots/Pages/DrawerClass.dart';
import 'contact_data.dart';
import 'contact_view.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ListaAlertasSuscritas extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea
      (child: Scaffold(
      appBar: AppBar(title: Text('Alertas')
      ),
        drawer: DrawerClass(),
      body: ContactList(kContacts)
      /*body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100),
          children: [
            Text('Hola')
          ],
        ),
      ),*/
    ),
    ),
    onWillPop: () => showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('Alerta'),
        content: Text('¿Desea cerrar sesión?'),
        actions: [
          TextButton(
              child: Text('Si'),
              onPressed: () => Navigator.pop(c, true)//Navigator.pop(c, true),
          ),
          TextButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(c, false),
          ),
        ],
      ),
    ),
    );
  }





}
