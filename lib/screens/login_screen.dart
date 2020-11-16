import 'package:flutter/material.dart';
import 'package:mymoney/custom/button.dart';
import 'package:mymoney/custom/textfield.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();

  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: _autovalidate
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/logo_transparent.png'
                            ),
                          ),
                          SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CustomTextField(
                              icon: Icons.mail,
                              hint: 'Correo',
                              fillColor: Colors.grey[900],
                              textInputAction: TextInputAction.done,
                              validator: (String value) {
                                if(value == null || value.isEmpty)
                                  return 'Este campo no puede estar vacío';
                                if(!value.contains('@'))
                                  return 'Correo inválido';
                                return null;
                              },
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: CustomTextField(
                              icon: Icons.lock,
                              hint: 'Contraseña',
                              isPassword: true,
                              focusNode: _passwordFocusNode,
                              visibilityToggleable: true,
                              fillColor: Colors.grey[900],
                              textInputAction: TextInputAction.done,
                              validator: (String value) {
                                if(value == null || value.isEmpty)
                                  return 'Este campo no puede estar vacío';
                                return null;
                              },
                            ),
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
                              } else {
                                setState(() => _autovalidate = true);
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