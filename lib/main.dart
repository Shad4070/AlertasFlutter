import 'package:flutter/material.dart';
import 'package:robots/Pages/LoginPage.dart';
//import 'package:robots/Pages/ListaAlertas.dart.dart';

void main() => runApp(Login());
String username;
String pass;

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      title: 'Alertas Robots',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(height: 50,buttonColor: Colors.blue, textTheme: ButtonTextTheme.primary),

      ),
      routes:<String, WidgetBuilder>{
        '/LoginPage':(BuildContext context) => new LoginPage(),
        //'/ListaAlertas':(BuildContext context) => new ListaAlertas(),
      },
    );
  }
}





