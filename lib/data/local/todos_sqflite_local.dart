import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/todos.dart';
import '../repository/todos_repository.dart';

class TodosSqfliteLocal implements TodosRepository {
  static const _databaseName = 'todos_database';
  static const _tableName = 'todos_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnPriority = 'priority';
  static const _columnCompleted = 'completed';
  static const _columnDueDate = 'dueDate';
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnTitle TEXT NOT NULL,
            $_columnPriority INTEGER NOT NULL,
            $_columnCompleted INTEGER NOT NULL,
            $_columnDueDate TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<List<Todos>> getTodos() async {
    try {
      final db = await database;
      List<Map<String, Object?>> data = await db.query(_tableName);
      return List<Todos>.from(data.map((x) => Todos.fromJson(x, isLocal: true)));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Todos> createTodos(Todos todos) async {
    final db = await database;
    await db.insert(
      _tableName,
      todos.toJson(isLocal: true),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return todos;
  }

  @override
  Future<String> deleteTodos(String id) {
    // TODO: implement deleteTodos
    throw UnimplementedError();
  }

  @override
  Future<Todos> editTodos(Todos todos) {
    // TODO: implement editTodos
    throw UnimplementedError();
  }

  @override
  Future<Todos> getDetailTodos(String id) {
    // TODO: implement getDetailTodos
    throw UnimplementedError();
  }

  @override
  Future<Todos> patchTodos(
      {String? id,
      String? title,
      String? completed,
      String? priority,
      String? dueDate}) {
    // TODO: implement patchTodos
    throw UnimplementedError();
  }
}
