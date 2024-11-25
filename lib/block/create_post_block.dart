import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/database/DatabaseHelper.dart';
import 'package:myapp/screen/note.dart';

class CreatePostBlock extends Bloc<CreatePostEvent, CreatedPostState> {
  CreatePostBlock(super.initialState) {
    on<CreatePostEvent>(
      (event, emit) {
        DatabaseHelper.insertNote(event.note);   
          // mainPhysicsList.add(event.note);
      }
    );
  }
}

class CreatedPostState {
}

class CreatePostEvent {
  final Note note;

  CreatePostEvent({required this.note}); 
}

