import 'dart:math';

import 'package:flutter/material.dart';

class PositionedButton extends StatelessWidget {
  final double angle;

  final Function() onPressed; // Angle in degrees

  const PositionedButton(
      {super.key, required this.angle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double radius = 100.0; // Adjust the radius as needed
    double radianAngle = angle * (pi / 180.0);
    double x = radius * cos(radianAngle);
    double y = radius * sin(radianAngle);

    return Positioned(
      top: y + MediaQuery.of(context).size.height / 2 - 25,
      left: x + MediaQuery.of(context).size.width / 2 - 25,
      child: Container(
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            // Action when the positioned button is pressed
            onPressed();
          },
          child: const Text('Button'),
        ),
      ),
    );
  }
}
