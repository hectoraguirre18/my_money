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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tightFor(height: height),
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/logo_transparent.png'
                ),
              ),
              SizedBox(height: 32),
              loginForm(),
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
              Spacer(),
              InkWell(
                onTap: () => print('continuar'),
                child: Text(
                  'Continuar sin cuenta',
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
    );
  }

  Widget loginForm() {
    return Form(
      key: formKey,
      autovalidateMode: _autovalidate
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}