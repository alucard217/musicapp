import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_bar_bloc_events.dart';
part 'search_bar_bloc_states.dart';

class SearchBarBloc extends Bloc<SearchBarEvent, SearchBarState>{

  SearchBarBloc() : super(SearchBarLocked()){
    on<UnlockSearchBar>((event, emit){
      emit(SearchBarUnlocked());
    });
    on<LockSearchBar>((event, emit){
      emit(SearchBarLocked());
    });
  }

}

