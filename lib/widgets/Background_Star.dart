import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackGroundStar extends StatelessWidget{
  final double size;

  const BackGroundStar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('lib/assets/star.png'),
      width: size,
      height: size,
    );
  }

}