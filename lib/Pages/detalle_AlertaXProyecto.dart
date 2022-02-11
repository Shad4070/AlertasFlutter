import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:robots/Pages/ListaAlertasSuscritas.dart';
import 'package:robots/Pages/DrawerClass.dart';


class detalle_AlertaXProyecto extends StatelessWidget {

  final String nombreEmpresa;
  final String state;


  detalle_AlertaXProyecto({Key key, @required this.nombreEmpresa, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state == '0')
    {
      return Scaffold(
        appBar: AppBar(title: Text(nombreEmpresa), backgroundColor: Color(0xffEE6060),
        ),
        drawer: DrawerClass(),
        body: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 100),
            children: [

            ],
          ),
        ),
      );
    }
    else if (state == '1')
    {
      return Scaffold(
        appBar: AppBar(title: Text(nombreEmpresa), backgroundColor: Color(0xff56D04E),
        ),
        drawer: DrawerClass(),
        body: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 100),
            children: [

            ],
          ),
        ),
      );
    }

  }
}