import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.colour,this.cardChild,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
// color: Color(0xFF1D1E33),
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}