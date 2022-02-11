import 'package:flutter/material.dart';
import 'package:robots/Pages/DrawerClass.dart';
import 'contact_data.dart';
import 'contact_view.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ListaAlertasSuscritas extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return SafeArea
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
    );

  }


}
