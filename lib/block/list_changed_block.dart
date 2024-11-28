import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/block/list_changed_event.dart';
import 'package:myapp/block/list_changed_state.dart';
import 'package:myapp/database/DatabaseHelper.dart';
import 'package:myapp/screen/note.dart';


class ListChangedBlock extends Bloc<ListChangeEvent, ListChangedState>{

  ListChangedBlock() : super(ListChangedState()) {
    on<ListLoadedChangeEvent> ((event, emit) async {
        list = await DatabaseHelper.getAllNotes();
        emit(ListLoadedState(myList: list));
        event.completer?.complete();
      }
    );

    on<DeletePostEvent>(
      (event, emit) async {
        int? noteId = event.id;
        DatabaseHelper.deleteNote(noteId);
        list = await DatabaseHelper.getAllNotes();
        emit(ListLoadedState(myList: list));
      }
    );
  }
}

List<Note> list = [];
