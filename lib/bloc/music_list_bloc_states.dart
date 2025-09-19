part of "music_list_bloc.dart";

abstract class MusicListState {}

class MusicListInitial extends MusicListState {}
class MusicListLoading extends MusicListState {}
class MusicListLoaded extends MusicListState {
  final List<dynamic> tracks;
  MusicListLoaded(this.tracks);
}
class MusicListNotFound extends MusicListState {}
