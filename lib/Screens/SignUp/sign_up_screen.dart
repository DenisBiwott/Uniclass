import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uniclass/Screens/Login/components/password_input_field.dart';
import 'package:uniclass/Screens/Login/components/rounded_input_field.dart';
import 'package:uniclass/Screens/SignUp/background.dart';
import 'package:uniclass/Screens/Welcome/components/rounded_button.dart';
import 'package:uniclass/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uniclass/Screens/HomePage/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

var email;
var password;

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
              // TO DO: Validate email and password fields
              RoundedInputField(
                icon: Icons.person,
                hintText: "Your email",
                onChanged: (value) {
                  email = value;
                },
              ),
              PasswordInputField(
                hintText: "Your Password",
                onChanged: (value) {
                  password = value;
                },
              ),
              // To DO: Handle errors
              RoundedButton(
                color: kPrimaryColor,
                text: "SIGN UP",
                textColor: kPrimaryLightColor,
                press: () {
                  firebaseAuthentication();
                  FirebaseAuth.instance.authStateChanges().listen(
                    (User user) {
                      if (user != null) {
                        //Pop until there is no other page
                        //Then replace the page with home screen to disable clicking back to open login again
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Create new user and sign them in
  firebaseAuthentication() async {
    // Handle errors
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(
          msg: 'The password provided is too weak.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryLightColor,
          textColor: kPrimaryColor,
          fontSize: 10.0,
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(
          msg: 'The account already exists for that email.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryLightColor,
          textColor: kPrimaryColor,
          fontSize: 10.0,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
