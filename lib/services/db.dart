// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class NotesDataBase {
//   static final NotesDataBase instance = NotesDataBase._init();
//   static Database? _database;
//   NotesDataBase._init();
//
//
//   Future<Database?> get database async{
//     if(_database != null) return _database;
//     _database =  await _initializeDB('Notes.db');
//     return _database;
//   }
//
//   Future<Database> _initializeDB(String filepath) async{
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filepath);
//
//     return await openDatabase(path, version: 1, onCreate: _createDB());
//   }
//
//   Future _createDB(Database db, int version) async {
//     await db.execute('''
//     CEREATE TABLE Notes(
//     id INTEGER PRIMARY KEY AUTO INCREMENT,
//     pin BOOLEAN NOT NULL,
//     title TEXT NOT NULL,
//     content TEXT NOT NULL,
//     createdTime TEXT NOT NULL
//     )
//     ''');
//   }
//   Future<bool?> create() async {
//     final db = await instance.database;
//     final id = await db?.insert("Notes", {"pin": false, "title": "This is my title", "content": "this is the content for the notes. that will be displayed in on the board", "createdTime": "26 Jab 2018"});
//   }
// }