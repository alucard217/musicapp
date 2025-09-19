import 'package:flutter/cupertino.dart';

class Gradient_Background extends StatelessWidget{
  final List<Color> gradients;
  const Gradient_Background({super.key, required this.gradients});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: gradients
          )
      ),
    );
  }

}