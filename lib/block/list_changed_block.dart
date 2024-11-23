import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/block/list_changed_event.dart';
import 'package:myapp/block/list_changed_state.dart';
import 'package:myapp/database/DatabaseHelper.dart';
import 'package:myapp/screen/note.dart';


class ListChangedBlock extends Bloc<ListChangeEvent, ListChangedState>{

  ListChangedBlock() : super(ListChangedState()) {
    on<ListLoadedChangeEvent>(
      (event, emit) async {
        emit(LoadingListChangeState());     
        fut.then((list) => list);
          if (list.isEmpty) {
            emit(EmptyListState());
          }
          else {
            emit(ListLoadedState(myList: list));
        }
      }
    );
  }
}

List<Note> list = [];

Future<List<Note>> fut = Future(() => DatabaseHelper.getAllNotes() );