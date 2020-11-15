import 'package:flutter/material.dart';

class EditText extends StatelessWidget {

  final String labelText;
  final Function(String) validator;
  final bool obscureText;

  EditText({this.labelText, this.validator, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white
        ),
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white
          ),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24)
          ),
        ),
        validator: validator ?? (_) => null,
      ),
    );
  }
}