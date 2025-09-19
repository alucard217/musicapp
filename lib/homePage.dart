import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/JamendoService.dart';
import 'package:musicapp/widgets/BackGround.dart';
import 'package:musicapp/widgets/MusicList.dart';
import 'package:musicapp/widgets/SearchBar.dart';

class HomePage extends StatelessWidget {
  final Background myBackground = Background();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MusicListBloc(JamendoService()),
        child: Stack(
          children: [
            myBackground,
            Center(
              child: MusicList(
                width: 250,
                height: 500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: MySearchBar(
          width: 200,
          height: 50,
          diameter: 30,
        ),
      ),
    );
  }
}

