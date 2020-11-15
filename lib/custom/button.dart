import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  final Function() onPressed;

  Button({@required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        child: Text(
          text.toUpperCase(),
        ),
        color: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        textColor: Colors.white,
        onPressed: onPressed ?? (){},
      ),
    );
  }
}