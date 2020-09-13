import 'package:flutter/material.dart';
import 'package:uniclass/Screens/Login/components/text_field_container.dart';

import '../../../constants.dart';

bool obscure = true;

class PasswordInputField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const PasswordInputField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: obscure,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
          suffixIcon: IconButton(
            tooltip: "Show password",
            icon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            onPressed: () {
              setState(
                () {
                  obscure = !obscure;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
