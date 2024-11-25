import 'dart:async';

class ListChangeEvent {}

class ListLoadingChangeEvent extends ListChangeEvent{}

class ListLoadedChangeEvent extends ListChangeEvent{
  final Completer? completer;

  ListLoadedChangeEvent({this.completer});
}
