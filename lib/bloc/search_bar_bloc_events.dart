part of 'search_bar_bloc.dart';

abstract class SearchBarEvent {}

class LockSearchBar extends SearchBarEvent{}
class UnlockSearchBar extends SearchBarEvent{}