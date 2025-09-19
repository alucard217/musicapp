import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/widgets/SnowFigure.dart';

class MusicTile extends StatelessWidget {
  final String author;
  final String name;

  const MusicTile({super.key, required this.author, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
        child: SnowFigure(
          borderRadius: 20,
          width: 240,
          height: 50,
          shadows: BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 5,
          ),
          color: Colors.grey.shade300,
          child: ListTile(
            title: Text(
              name,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            trailing: Text(
              author,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
    );
  }
}
