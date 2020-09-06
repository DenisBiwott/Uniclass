import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uniclass/Screens/Welcome/components/background.dart';
import 'package:uniclass/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WELCOME TO UNICLASS",
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            width: size.width * 0.8,
            height: size.height * 0.4,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FlatButton(
                onPressed: () {},
                child: Text('LOGIN', style: TextStyle(color: Colors.white),),
                color: kPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
