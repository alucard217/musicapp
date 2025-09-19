import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/widgets/MusicTile.dart';
import 'package:musicapp/widgets/SnowFigure.dart';

import '../bloc/music_list_bloc.dart';


class MusicList extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final player = AudioPlayer();

  MusicList({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {

  @override
  Widget build(BuildContext context) {
    return SnowFigure(
      borderRadius: 20,
      width: widget.width,
      height: widget.height,
      shadows: const BoxShadow(
        color: Colors.white,
        blurRadius: 5,
        spreadRadius: 20,
      ),
      color: widget.color,
      child: BlocBuilder<MusicListBloc, MusicListState>(
        builder: (context, state) {
          if (state is MusicListLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.grey));
          } else if (state is MusicListLoaded) {
            return ListView.builder(
              itemCount: state.tracks.length,
              itemBuilder: (context, index) {
                final track = state.tracks[index];
                return GestureDetector(
                  onTap: () async {
                    await widget.player.setUrl(track['audio']);
                    widget.player.setVolume(1);
                    widget.player.play();
                  },
                  child: MusicTile(
                    author: track['artist_name'],
                    name: track['name'],
                  ),
                );
              },
            );
          } else if (state is MusicListNotFound) {
            return const Center(child: Text("Nothing found"),);
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}
