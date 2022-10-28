import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqLit {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final datbaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');
    return await openDatabase(datbaseFinalPath, version: 3,
        onConfigure: (db) async {
      await db.execute('PRAGMA_foreign_Keys = ON');
    }, onCreate: (Database db, int version) {
      final batch = db.batch();
      batch.execute('''
        create table teste(
          id Integer primary key autoincrement,
          nome varchar(200)
        )
        ''');
      batch.execute('''
        create table produto(
          id Integer primary key autoincrement,
          nome varchar(200)
        )
        ''');
      // batch.execute('''
      //   create table categoria(
      //     id Integer primary key autoincrement,
      //     nome varchar(200)
      //   )
      //   ''');
      batch.commit();
    }, onUpgrade: (Database db, int oldVersion, int version) {
      final batch = db.batch();
      if (oldVersion == 1) {
        batch.execute('''
        create table produto(
          id Integer primary key autoincrement,
          nome varchar(200)
        )
        ''');
      }
      // if (oldVersion == 2) {
      //   batch.execute('''
      //   create table categoria(
      //     id Integer primary key autoincrement,
      //     nome varchar(200)
      //   )
      //   ''');
      // }
      batch.commit();
    }, onDowngrade: (Database db, oldVersion, int version) {
      final batch = db.batch();
      if (oldVersion == 3) {
        batch.execute('''
          drop table categoria
        ''');
      }
      batch.commit();
    });
  }
}
