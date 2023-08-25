import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDataBase {
  static final NotesDataBase instance = NotesDataBase._init();
  static Database? _database;
  NotesDataBase._init();


  Future<Database?> get database async{
    if(_database != null) return _database;
    _database =  await _initializeDB('Notes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
    // the method _createDB in line 23 takes two parameters, whereas while calling it, we dont give
    // any parameters to the method??? why?
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Notes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pin BOOLEAN NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    createdTime TEXT NOT NULL
    );
    
    ''');
  }
  Future<bool?> create() async {
    final db = await instance.database;
    final id = await db?.insert("Notes", {"pin": 0, "title": "This is my 898th title", "content": "this is the content for the notes. that will be displayed in on the board", "createdTime": "26 Jan 2018"});
    return true;
  }

  Future<String?> readAllNotes() async {
    final db = await instance.database;
    final orderBy = 'createdTime ASC';
    final query_result = await db!.query("Notes");
    print(query_result);
    return "SUCCESSFUL";
  }

  Future<String?> readOneNote(int id) async{
    final db = await instance.database;
    final map = await db!.query("Notes",
      columns:["title"], where :'id = ?',
        whereArgs: [id]
    );
    print(map);
  }
  Future updateNotes(int id) async{
    final db = await instance.database;
    return await db!.update("Notes", {"title": "This is an updated title for 4th id","content":"this field contains updated content"},
    where: "id = ?", whereArgs: [id]);
  }
  Future deleteNote(int id) async{
    final db = await instance.database;
    await db!.delete("Notes", where: 'id = ?', whereArgs: [id]);
  }
}