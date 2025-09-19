import 'package:flutter_bloc/flutter_bloc.dart';

import '../JamendoService.dart';

part "music_list_bloc_states.dart";
part "music_list_bloc_events.dart";

class MusicListBloc extends Bloc<MusicListEvent, MusicListState> {
  final JamendoService service;

  MusicListBloc(this.service) : super(MusicListInitial()) {
    on<LoadMusic>((event, emit) async{
      emit(MusicListLoading());
      try{
        final results = await service.findPopularTracks(limit: 7);
        emit(MusicListLoaded(results));
      }
      catch(e){
        emit(MusicListNotFound());
      }
    });

    on<SearchMusic>((event, emit) async {
      emit(MusicListLoading());
      try {
        final results = await service.findTrack(event.query);
        if (results.isEmpty) {
          emit(MusicListNotFound());
        } else {
          emit(MusicListLoaded(results));
        }
      } catch (e) {
        emit(MusicListNotFound());
      }
    });
  }
}