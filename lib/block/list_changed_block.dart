import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/database/DatabaseHelper.dart';
import 'package:myapp/screen/main_screen.dart';
import 'package:myapp/screen/note.dart';


class ListChangedBlock extends Bloc<ListChangeEvent, ListChangedState>{

  ListChangedBlock() : super(ListChangedState(myList: mainPhysicsList)) {
    on<LoadingChangeEvent>((event, emit) => emit(LoadingListChangeState(myList: mainPhysicsList))
    );
    on<ListChangeEvent>((event, emit) {
      if (mainPhysicsList.isNotEmpty) {
        (event, emit) => emit(ListChangedState(myList: mainPhysicsList));
      }
    });
  }
}

class ListChangeEvent {}

class LoadingChangeEvent extends ListChangeEvent{}

class ListChangedState {
  final List<Note> myList;

  ListChangedState({required this.myList});  
}

class LoadingListChangeState extends ListChangedState {
  LoadingListChangeState({required super.myList});
}

class ListUpdated extends ListChangedState {
  ListUpdated({required super.myList});
}

class EmptyListState extends ListChangedState {
  EmptyListState({required super.myList});
}

// Future<List<Note>> getAllNotes() async {
//   return await DatabaseHelper.getAllNotes();
// }