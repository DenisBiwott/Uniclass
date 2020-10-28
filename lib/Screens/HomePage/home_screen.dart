import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uniclass/Screens/Welcome/welcome_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WelcomeScreen();
            },
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () => logOut()),
        ],
        title: Text('Uniclass'),
      ),
      body: Center(
        child: Text('You are logged in!'),
      ),
    );
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
