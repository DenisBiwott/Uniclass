import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uniclass/Screens/HomePage/home_screen.dart';
import 'package:uniclass/Screens/Login/components/background.dart';
import 'package:uniclass/Screens/Login/components/password_input_field.dart';
import 'package:uniclass/Screens/Login/components/rounded_input_field.dart';
import 'package:uniclass/Screens/SignUp/sign_up_screen.dart';
import 'package:uniclass/Screens/Welcome/components/rounded_button.dart';
import 'package:uniclass/constants.dart';

var email;
var password;

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
                email = value;
              },
              hintText: "Your email",
            ),
            PasswordInputField(
              onChanged: (value) {
                password = value;
              },
              hintText: "Your Password",
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              textColor: kPrimaryLightColor,
              press: () {
                signIn();
                FirebaseAuth.instance.authStateChanges().listen((User user) {
                  if (user != null) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  }
                });
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUp();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: 'No user found for that email.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryLightColor,
          textColor: kPrimaryColor,
          fontSize: 10.0,
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: 'Wrong password provided for that user.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryLightColor,
          textColor: kPrimaryColor,
          fontSize: 10.0,
        );
        print('Wrong password provided for that user.');
      }
    }
  }
}
