import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/bloc/search_bar_bloc.dart';
import 'package:musicapp/bloc/music_list_bloc.dart';
import 'package:musicapp/widgets/SnowFigure.dart';

class MySearchBar extends StatefulWidget {
  final double diameter;
  final double width;
  final double height;

  const MySearchBar({
    super.key,
    required this.diameter,
    required this.width,
    required this.height,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarBloc, SearchBarState>(
      builder: (context, state) {
        final isLocked = state is SearchBarLocked;
        return GestureDetector(
          onTap: () {
            if (isLocked) {
              context.read<SearchBarBloc>().add(UnlockSearchBar());
            }
          },
          child: SnowFigure(
            borderRadius: isLocked ? 100 : 50,
            width: isLocked ? widget.diameter : widget.width,
            height: isLocked ? widget.diameter : widget.height,
            shadows: BoxShadow(
              color: Colors.white,
              blurRadius: isLocked ? 10 : 5,
              spreadRadius: 20,
            ),
            color: Colors.white,
            child: isLocked
                ? Icon(Icons.search, size: 28, color: Colors.grey.shade300)
                : TextField(
              cursorColor: Colors.grey.shade300,
              style: TextStyle(color: Colors.grey.shade400),
              decoration: InputDecoration(
                icon: Icon(Icons.search,
                    size: 28, color: Colors.grey.shade300),
                border: InputBorder.none,
              ),
              onTapOutside: (_) {
                context.read<SearchBarBloc>().add(LockSearchBar());
              },
              onSubmitted: (query) {
                context.read<MusicListBloc>().add(SearchMusic(query));
              },
            ),
          ),
        );
      },
    );
  }
}
