import 'package:flutter/material.dart';
import 'package:uniclass/Screens/Login/components/text_field_container.dart';

import '../../../constants.dart';

class RoundedInputField extends StatelessWidget {
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedInputField({
    Key key,
    this.icon,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
