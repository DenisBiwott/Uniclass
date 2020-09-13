import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uniclass/Screens/Login/components/password_input_field.dart';
import 'package:uniclass/Screens/Login/components/rounded_input_field.dart';
import 'package:uniclass/Screens/SignUp/background.dart';
import 'package:uniclass/Screens/Welcome/components/rounded_button.dart';
import 'package:uniclass/constants.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SignUpBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                width: size.width * 0.8,
                height: size.height * 0.4,
              ),
              RoundedInputField(
                icon: Icons.person,
                hintText: "Your email",
                onChanged: (value) {},
              ),
              PasswordInputField(
                hintText: "Your Password",
                onChanged: (value) {},
              ),
              RoundedButton(
                color: kPrimaryColor,
                text: "SIGN UP",
                textColor: kPrimaryLightColor,
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
