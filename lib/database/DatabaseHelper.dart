import 'package:myapp/screen/note.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  late final Database? database;

    static Future<void> createTables(Database database) async {
      await database.execute("""
        DROP TABLE IF EXISTS notes;
        """);
      await database.execute("""
          CREATE TABLE IF NOT EXISTS notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            title VARCHAR,
            description VARCHAR
          );
        """);
    }



    static Future<Database> db() async {
      return openDatabase(
        'notes.db',
        version: 1,
        onCreate: (Database database, int version) async {
          await createTables(database);
        },
        onOpen: (db) async => print('database was created with version: ${ await db.getVersion()}'),
      );
    } 


    static Future<void> insertNote(Note note) async {
      // Get a reference to the database.
      final database = await DatabaseHelper.db();
      int num = await database.insert(
        'notes',
        note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('Объект создан с id $num');
    }

    static Future<List<Note>> getAllNotes() async {
      final database = await DatabaseHelper.db();

      List<Map<String, dynamic>> noteMaps = await database.query('notes');

      List<Note> notes = [];


      notes = [
              for (final {
                    'title': title as String,
                    'description': description as String,
                  } in noteMaps)
                Note(title: title, description:  description),
              ];

      return notes;

    }

    static Future<void> deleteAllNotes() async {
      final database = await DatabaseHelper.db();

      await database.rawDelete("""
        DELETE * FROM notes;
        """);
    }
}
