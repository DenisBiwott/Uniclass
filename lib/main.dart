import 'package:flutter/material.dart';
import 'package:uniclass/Screens/Welcome/welcome_screen.dart';
import 'constants.dart';

void main() => runApp(UniClass());

class UniClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniClass',
      theme: ThemeData(
        primaryColor:kPrimaryColor,
        scaffoldBackgroundColor: Colors.white, 
      ),
      home: WelcomeScreen(),
    );
  }
}
