import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String txt;
  IconContent({this.txt,this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(txt,style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,

        ),)
      ],
    );
  }
}