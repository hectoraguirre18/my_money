import 'package:flutter/material.dart';
import 'package:mymoney/custom/button.dart';
import 'package:mymoney/custom/edittext.dart';


class LoginScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                            validator: (String value) {
                              if(value == null || value.isEmpty)
                                return 'Este campo no puede estar vacío';
                              if(!value.contains('@'))
                                return 'Correo inválido';
                              return null;
                            },
                          ),
                          EditText(
                            labelText: 'Contraseña',
                            obscureText: true,
                            validator: (String value) {
                              if(value == null || value.isEmpty)
                                return 'Este campo no puede estar vacío';
                              return null;
                            },
                          ),
                          Button(
                            text: 'Ingresar',
                            onPressed: () {
                              //TODO Checar login y abrir siguiente pantalla
                              if(formKey.currentState.validate()) {
                                //login()
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    appBar: AppBar(),
                                  )
                                ));
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => print('continuar'),
                                  child: Text(
                                    '¿Olvidaste tu\ncontraseña?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => print('continuar'),
                                  child: Text(
                                    '¿No tienes\nuna cuenta?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => print('continuar'),
                      child: Text(
                        'Continuar\nsin cuenta',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
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