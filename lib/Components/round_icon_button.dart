import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed, this.colour});

  final IconData icon;
  final Function onPressed;
  final colour;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: colour,
      constraints: BoxConstraints.tightFor(
        width: 47,
        height: 47,
      ),
    );
  }
}
