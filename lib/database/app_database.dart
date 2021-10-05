import 'package:obracalc/dao/servico_dao.dart';
import 'package:obracalc/dao/usuario_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'obracalc.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(UsuarioDao.tableSql);
      db.execute(ServicoDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete
  );
}
