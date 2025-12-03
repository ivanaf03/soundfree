import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:soundfree/core/database/database_tables.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static const dbName = 'soundfree.db';
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await DatabaseTables.createTables(db);
      },
    );
  }
}
