import 'package:flutter/material.dart';
import 'package:mymoney/custom/button.dart';
import 'package:mymoney/custom/textfield.dart';


class RegisterAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterAccountState();
}

class RegisterAccountState extends State<RegisterAccount> {

  final formKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _mailFocusNode = FocusNode();
  final _passwordFocusNode2 = FocusNode();

  bool _autovalidate = false;

  var pass = '';

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
                child: Text(
                  'Crea tu\ncuenta',
                  style: TextStyle(
                  color: Colors.teal,
                  fontSize: 40, 
                  ),
                ),
              ),
              SizedBox(height: 32),
              registerForm(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerForm() {
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
              icon: Icons.person,
              hint: 'Nombre',
              fillColor: Colors.grey[900],
              textInputAction: TextInputAction.done,
              validator: (String value) {
                if(value == null || value.isEmpty)
                  return 'Este campo no puede estar vacío';
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context)
                  .requestFocus(_mailFocusNode),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CustomTextField(
              icon: Icons.mail,
              hint: 'Correo',
              focusNode: _mailFocusNode,
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
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CustomTextField(
              icon: Icons.lock,
              hint: 'Contraseña',
              isPassword: true,
              focusNode: _passwordFocusNode,
              visibilityToggleable: true,
              fillColor: Colors.grey[900],
              textInputAction: TextInputAction.done,
              validator: (String value) {
                pass = value;
                if(value == null || value.isEmpty)
                  return 'Este campo no puede estar vacío';
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context)
                .requestFocus(_passwordFocusNode2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: CustomTextField(
              icon: Icons.lock,
              hint: 'Confirmar Contraseña',
              isPassword: true,
              focusNode: _passwordFocusNode2,
              visibilityToggleable: true,
              fillColor: Colors.grey[900],
              textInputAction: TextInputAction.done,
              validator: (String value) {
                if(value == null || value.isEmpty)
                  return 'Este campo no puede estar vacío';
                if(value != pass){
                 print('$value $pass');
                 return 'Las contraseñas no coinciden'; 
                }
                return null;
              },
            ),
          ),
          Button(
            text: 'Registrar',
            onPressed: () {
              //TODO Checar login y abrir siguiente pantalla
              if(formKey.currentState.validate()) {
                //creatte account()
                Navigator.pop(context);
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