import 'package:firebase_auth/firebase_auth.dart';
import 'package:uniclass/Screens/HomePage/home_screen.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:uniclass/Screens/Welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(UniClass());
}

class UniClass extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'UniClass',
            theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: kPrimaryLightColor,
            ),
            home: Scaffold(
              body: Center(
                child: Text('Something is not right. Restart the app'),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          User firebaseUser = FirebaseAuth.instance.currentUser;
          Widget firstWidget;
          if (firebaseUser != null) {
            firstWidget = Home();
          } else {
            firstWidget = WelcomeScreen();
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'UniClass',
            theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: firstWidget,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UniClass',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimaryLightColor,
          ),
          home: Scaffold(
            body: Center(),
          ),
        );
      },
    );
  }
}
