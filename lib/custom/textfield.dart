import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final IconData icon;
  final String hint;
  final Color fillColor;
  final bool enabled;
  final Function(String) validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Function(String) onFieldSubmitted;
  final bool isPassword;
  final bool clearable;
  final bool visibilityToggleable;

  final String initialValue;

  CustomTextField({
    this.hint,
    this.icon,
    this.fillColor,
    this.enabled = true,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.isPassword = false,
    this.clearable = false,
    this.visibilityToggleable = false,
    this.initialValue,
  }): assert(clearable == false || visibilityToggleable == false);

  @override
  State<StatefulWidget> createState() => _TextFieldState(isPassword);
}
class _TextFieldState extends State<CustomTextField>{

  bool isPassword;

  final _controller = TextEditingController();

  _TextFieldState(
    this.isPassword,
  );

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.enabled,
      child: TextFormField(
        controller: _controller,
        validator: widget.validator,
        maxLines: 1,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        obscureText: isPassword,
        initialValue: widget.initialValue,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16
        ),
        cursorColor: Colors.teal,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (_) {
          if(widget.clearable) {
            setState((){});
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Colors.red
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Colors.red
            ),
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey[700],
            fontSize: 16
          ),
          prefixIcon: widget.icon != null
            ? Icon(
              widget.icon,
              color: Colors.white,
            )
            : null,
          fillColor: widget.fillColor ?? Colors.grey[900],
          filled: true,
          suffixIcon: suffixIcon(),
        ),
      ),
    );
  }

  Widget suffixIcon() {
    if(widget.clearable && _controller.text.isNotEmpty) {
      return IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.white,
        ),
        splashColor: Colors.transparent,
        onPressed: () {
          setState(() => _controller.clear());
        }
      );
    }
    if(widget.visibilityToggleable) {
      return IconButton(
        splashColor: Colors.transparent,
        icon: Icon(
          isPassword ? Icons.visibility : Icons.visibility_off,
          color: Colors.white,
        ),
        onPressed: (){
          print('pressed visibility $isPassword');
          setState(() => isPassword = !isPassword);
          
          print('after state $isPassword');
        }
      );
    }
    return null;
  }
}