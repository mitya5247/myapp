import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/block/create_post_event.dart';
import 'package:myapp/block/create_post_state.dart';
import 'package:myapp/database/DatabaseHelper.dart';

class CreatePostBlock extends Bloc<PostEvent, CreatedPostState> {
  CreatePostBlock(super.initialState) {
    on<CreatePostEvent>(
      (event, emit) {
        DatabaseHelper.insertNote(event.note);   
          // mainPhysicsList.add(event.note);
      }
    );
  }
}



