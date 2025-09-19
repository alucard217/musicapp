import 'dart:ui';
import 'package:flutter/material.dart';

class BackGroundCity extends StatelessWidget {
  const BackGroundCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('lib/assets/citySilhouette.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(

          ),
        ),
      ),
    );
  }
}
