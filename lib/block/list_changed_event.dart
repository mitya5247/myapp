import 'dart:async';

class ListChangeEvent {}

class ListLoadingChangeEvent extends ListChangeEvent{}

class ListLoadedChangeEvent extends ListChangeEvent{
  final Completer? completer;

  ListLoadedChangeEvent({this.completer});
}


class DeletePostEvent extends ListChangeEvent {
  final int? id;

  DeletePostEvent({required this.id});
}
