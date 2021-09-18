import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'obracalc.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE usuarios('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'login TEXT, '
          'senha TEXT )');
    }, version: 1);
  });
}
