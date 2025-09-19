import 'dart:math';
import 'package:flutter/material.dart';
import 'package:musicapp/widgets/Gradient_Background.dart';
import 'SnowFigure.dart';
import 'Background_CitySilhouette.dart';

final Random random = Random();


class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  late List<AnimationController> controllers;
  late List<double> startPositions;
  late List<double> circleSizes;
  final int ballCount = 8;

  @override
  void initState() {
    super.initState();

    startPositions = List.generate(
      ballCount,
          (_) => Random().nextDouble(),
    );

    circleSizes = List.generate(
        ballCount,
            (_) => Random().nextDouble()
    );

    controllers = List.generate(
      ballCount,
          (index) =>
      AnimationController(
        vsync: this,
        duration: Duration(
            seconds: (circleSizes[index] + 10 + (index * 5)).toInt()),
      )
        ..repeat(),
    );
  }


  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Stack(
          children: [
            Gradient_Background(
                gradients: [
                  Color(0xFF3C1361),
                  Color(0xFF2E1A47),
                  Color(0xFF000014),
                ]
            ),
            ...List.generate(ballCount, (i) {
              return AnimatedBuilder(
                animation: controllers[i],
                builder: (context, child) {
                  final t = controllers[i].value;

                  final w = sizeScreen.width;
                  final h = sizeScreen.height;

                  final startX = w * (startPositions[i] - 0.5);
                  final startY = h + (circleSizes[i] + 50);
                  final endX = w * (1 + startPositions[i] - 0.5);
                  final endY = -circleSizes[i] - 30;

                  final x = startX + (endX - startX) * t;
                  final y = startY + (endY - startY) * t;

                  final sinus = circleSizes[i] * 20 * sin(t * w / 50);

                  return Transform.translate(
                    offset: Offset(x + sinus, y),
                    child: child,
                  );
                },
                child: SnowFigure(
                  height: circleSizes[i],
                  width: circleSizes[i],
                  borderRadius: 100,
                  shadows: BoxShadow(
                    color: Colors.white,//Colors.grey.shade700,
                    blurRadius: 20,
                    spreadRadius: 30
                  ),
                  color: Colors.transparent,
                  child: null,
                ),
              );
            }),
          ]
      ),
    );
  }
}
