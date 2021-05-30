import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fam_church/screens/notes/models/note_model.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes(
  ${NoteFields.id}  $idType 
  ${NoteFields.isImportant}  $boolType 
  ${NoteFields.number}  $integerType
  ${NoteFields.title} $textType
  ${NoteFields.description} $textType
  ${NoteFields.time} $textType
)
''');
  }

// creave a nove
  Future<NoteModel> create(NoteModel noteModel) async {
    final db = await instance.database;
    //final json = noteModel.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';

    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';

    // final id =
    //     await db.rawInsert('INSERt INtO table_name ($columns) VALUES($values)');

    final id = await db.insert(tableNotes, noteModel.toJson());
    return noteModel.copy(id: id);
  }

//read notes
  Future<NoteModel?> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NoteModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

//read all avail notes
  Future<List<NoteModel>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NoteFields.time} ASC';
    // final result = await db.rawQuery('SELECt *FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => NoteModel.fromJson(json)).toList();
  }

//update your notes
  Future<int> update(NoteModel noteModel) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      noteModel.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [noteModel.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
