import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  final Widget child;
  const SignUpBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset("assets/images/signup_top.png"),
            height: size.height * 0.2,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/main_bottom.png"),
            height: size.height * 0.3,
          ),
          child,
        ],
      ),
    );
  }
}
