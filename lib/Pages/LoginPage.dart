import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:robots/API/ConsumosAPIs.dart';
import 'package:robots/Pages/ListaAlertasSuscritas.dart';
import 'dart:convert';


class LoginPage extends StatelessWidget {

  final myEmail = TextEditingController();
  final myPassword = TextEditingController();
  final jsonData = '';



  Widget createEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: TextFormField(
        controller: myEmail,
        keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'ejemplo@correo.com',
              labelText: 'Correo Electronico',
              icon: Icon(Icons.email)),
          onChanged: (value){

          },
          textAlign: TextAlign.center),

    );
  }

  Widget createPassInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: myPassword,
        decoration: InputDecoration(hintText: 'Contraseña',
            labelText: 'Contraseña',
            icon: Icon(Icons.lock)),
        onChanged: (value){

        },
        obscureText: true,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget Espacios() {
    return Padding(
      padding: const EdgeInsets.only(top: 80)
    );
  }

  Future<String> _futurePost;

  Widget createButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        child: Text('Entrar'),
        onPressed: () {

          if (myEmail.text == '' || myPassword.text == ''){
            return showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: const Text('Inicio sesión'),
                  content: const  Text('Usuario y/o Contraseña Incorrectos.'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK')
                    )
                  ],
                );
              },
            );
          }
          else{
            _futurePost = consultarToken(myEmail.text, myPassword.text);
            print(_futurePost);
            return showDialog(context: context,
                builder: (context){

              return Center(
              child: FutureBuilder(
                future: _futurePost,
                builder: (context,snapshot){
                  print(snapshot.hasData);

                   if(snapshot.hasData){
                     //print(snapshot.data);

                  //
                     if (snapshot.data != '{"mensaje":"Usuario no valido"}'){


                      final jsonData = jsonDecode(snapshot.data);
                      //print(jsonData["token"]);
                      return AlertDialog(
                        title: const Text('Inicio sesión'),
                        content: const  Text('Ingreso Exitoso!'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pushReplacement(context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) => new ListaAlertasSuscritas()
                                ),
                              ),

                              child: const Text('OK')
                          )
                        ],
                      );
                    }
                    else {
                      return AlertDialog(
                            title: const Text('Inicio sesión'),
                            content: const  Text('Usuario y/o Contraseña Incorrectos.'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK')
                              )
                            ],
                          );
                    }
                  //   else if(snapshot.hasError){
                  //   return AlertDialog(
                  //     title: const Text('Inicio sesión'),
                  //     content: const  Text('Usuario y/o Contraseña Incorrectos.'),
                  //     actions: [
                  //       TextButton(
                  //           onPressed: () => Navigator.pop(context, 'OK'),
                  //           child: const Text('OK')
                  //       )
                  //     ],
                  //   );
                  // }
                }
                   return Center(child: CircularProgressIndicator(),);
                }


              ),

            );
            }
            );
          }

        },
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
      ),
    );
  }

  //
  // FutureBuilder<Post> buildFutureBuilder() {
  //   return FutureBuilder<Post>(
  //     future: _futurePost,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Text(snapshot.data.userName);
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }
  //
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child:
            Scaffold(
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                decoration: BoxDecoration(color: Colors.white),
                child: ListView(
                  children: [
                    Espacios(),
                    Image.asset('assets/images/WASolutions.png', width: 900, height: 150, scale: 1.0),
                    createEmailInput(),
                    createPassInput(),
                    createButton(context),
                    Espacios(),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){showDialog(context: context,
                    builder: (context) => AlertDialog(
                        title: Text("Ayuda"),
                        content: Text("Para mas informacion comuniquese a soporte@wasolutions.co o tambien al celular +57 312 329 4131")
                    )
                  );
                },
                child: const Icon(Icons.help_outline, color: Colors.grey,),
                backgroundColor: Colors.white,
              ),
            ),

        onWillPop: () => showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('Alerta'),
        content: Text('¿Desea salir de la aplicación?'),
        actions: [
          TextButton(
            child: Text('Si'),
            onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop')//Navigator.pop(c, true),
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
