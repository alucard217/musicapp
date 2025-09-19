import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/widgets/MusicList.dart';
import 'package:musicapp/widgets/SnowFigure.dart';

class MySearchBar extends StatefulWidget {
  final double diameter;
  final double width;
  final double height;
  final TextEditingController controller = TextEditingController();

  MySearchBar({
    super.key,
    required this.diameter,
    required this.width,
    required this.height,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  bool isCircle = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCircle = false;
        });
      },
      child: Stack(
        children: [
          SnowFigure(
            width: isCircle ? widget.diameter : widget.width,
            height: isCircle ? widget.diameter : widget.height,
            borderRadius: isCircle ? 100 : 50,
            shadows: BoxShadow(
              color: Colors.white,
              blurRadius: isCircle ? 10 : 5,
              spreadRadius: 20,
            ),
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.centerLeft,
              child: isCircle
                  ? Icon(Icons.search, size: 28, color: Colors.grey.shade300)
                  : TextField(
                controller: widget.controller,
                cursorColor: Colors.grey.shade300,
                style: TextStyle(color: Colors.grey.shade400),
                decoration: InputDecoration(
                  icon: GestureDetector(
                    onTap: () {
                      final query = widget.controller.text.trim();
                      if (query.isNotEmpty) {
                        context
                            .read<MusicListBloc>()
                            .add(SearchMusic(query));
                      }
                    },
                    child: Icon(Icons.search,
                        size: 28, color: Colors.grey.shade300),
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.read<MusicListBloc>().add(SearchMusic(value));
                  }
                },
                onTapOutside: (event) {
                  setState(() {
                    isCircle = true;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
