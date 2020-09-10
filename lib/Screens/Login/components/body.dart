import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uniclass/Screens/Login/components/background.dart';
import 'package:uniclass/Screens/Welcome/components/rounded_button.dart';
import 'package:uniclass/constants.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              width: size.width * 0.8,
              height: size.height * 0.4,
            ),
            RoundedInputField(
              icon: Icons.person,
              onChanged: (value) {},
              hintText: "Your email",
            ),
            PasswordInputField(
              onChanged: (value) {},
              hintText: "Your Password",
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              textColor: kPrimaryLightColor,
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}

// TODO: Move these to seperate files
class PasswordInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const PasswordInputField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

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

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kPrimaryLightColor),
      width: size.width * 0.8,
      child: child,
    );
  }
}
