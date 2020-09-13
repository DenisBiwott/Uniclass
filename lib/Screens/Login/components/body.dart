import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uniclass/Screens/Login/components/background.dart';
import 'package:uniclass/Screens/Login/components/password_input_field.dart';
import 'package:uniclass/Screens/Login/components/rounded_input_field.dart';
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
              onChanged: (value) {
                print("The email is $value");
              },
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
