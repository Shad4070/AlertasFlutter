import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:robots/Pages/ListaAlertasSuscritas.dart';


class LoginPage extends StatelessWidget {

  final myEmail = TextEditingController();
  final myPassword = TextEditingController();

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
            if (myEmail.text == 'juanes@wasolutions.co' && myPassword.text == '12345'){
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => new ListaAlertasSuscritas()
                ),
              );
            }
            else{
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
          }

        },
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
      ),
    );
  }

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
        title: Text('Warning'),
        content: Text('Do you really want to exit'),
        actions: [
          TextButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(c, true),
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
