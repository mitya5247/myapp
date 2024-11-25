import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {

  // int? id;
  // String title;
  // String description;
  // // String date;

  const Note._();

  const factory Note({
    int? id,
    required String title, 
    required String description,
    }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);

  // toMap() {
  //   return {
  //     'title': title,
  //     'description': description,
  //     };
  // }

  // toList(Map<String, dynamic> e) {
  //   e.forEach(
  //     Note(e['title'], e['description']);
  //   )
  // }

}