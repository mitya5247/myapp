import 'package:myapp/screen/note.dart';


class ListChangedState {}

class LoadingListChangeState extends ListChangedState {}

class ListLoadedState extends ListChangedState {
  final List<Note> myList;

  ListLoadedState({required this.myList});  
}

class EmptyListState extends ListChangedState {}