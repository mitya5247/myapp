import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/block/list_changed_event.dart';
import 'package:myapp/block/list_changed_state.dart';
import 'package:myapp/database/DatabaseHelper.dart';
import 'package:myapp/screen/note.dart';


class ListChangedBlock extends Bloc<ListChangeEvent, ListChangedState>{

  ListChangedBlock() : super(ListChangedState()) {
    on<ListLoadedChangeEvent> ((event, emit) async {
      try {
        emit(LoadingListChangeState());     
        list = await DatabaseHelper.getAllNotes();
        emit(ListLoadedState(myList: list));
      } catch (e) {
        emit(EmptyListState());
      }
        // if (list.isEmpty) {
        //   emit(EmptyListState());
        // } else {
        //   emit(ListLoadedState(myList: list));
        // }
      }

    );
    on<ListLoadingChangeEvent> ((event, emit) => print('cработало событие загрузки'),);

  }
}

List<Note> list = [];

// Future<List<Note>> fut = Future(() => DatabaseHelper.getAllNotes());