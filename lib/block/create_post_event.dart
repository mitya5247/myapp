import 'package:myapp/screen/note.dart';

class PostEvent{}

class CreatePostEvent extends PostEvent {
  final Note note;

  CreatePostEvent({required this.note}); 
}
