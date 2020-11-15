import 'package:flutter/material.dart';
import 'package:mymoney/custom/button.dart';
import 'package:mymoney/custom/edittext.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: double.infinity),
                          Text(
                            'My Money',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(height: 32),
                          EditText(
                            labelText: 'Correo',
                          ),
                          EditText(
                            labelText: 'Contraseña',
                          ),
                          Button(
                            text: 'Ingresar',
                            onPressed: () {
                              //TODO Checar login y abrir siguiente pantalla
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '¿Olvidaste tu\ncontraseña?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  '¿No tienes\nuna cuenta?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Continuar\nsin cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  
}