import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/JamendoService.dart';
import 'package:musicapp/bloc/search_bar_bloc.dart';
import 'package:musicapp/widgets/BackGround.dart';
import 'package:musicapp/widgets/MusicList.dart';
import 'package:musicapp/widgets/SearchBar.dart';

import 'bloc/music_list_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MusicListBloc _musicListBloc = MusicListBloc(JamendoService());
  final SearchBarBloc _searchBarBloc = SearchBarBloc();
  final Background _background = Background();
  final MySearchBar _searchBar = MySearchBar(
    diameter: 30,
    width: 200,
    height: 50,
  );
  final MusicList _musicList = MusicList(
      width: 300,
      height: 500,
      color: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    _musicListBloc.add(LoadMusic());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => _musicListBloc),
        BlocProvider(create: (BuildContext context) => _searchBarBloc),
      ],
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _searchBar,
        ),
        body: Stack(
          children: [
            _background,
            Center(child: _musicList,)
          ],
        ),
      ),
    );
  }
}
