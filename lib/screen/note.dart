class Note {

  int? id;
  String title;
  String description;
  // String date;

  Note(this.title, this.description);

  toMap() {
    return {
      'title': title,
      'description': description,
      };
  }

  // toList(Map<String, dynamic> e) {
  //   e.forEach(
  //     Note(e['title'], e['description']);
  //   )
  // }

}