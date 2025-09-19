part of "music_list_bloc.dart";

abstract class MusicListEvent {}

class LoadMusic extends MusicListEvent {}
class SearchMusic extends MusicListEvent {
  final String query;
  SearchMusic(this.query);
}




