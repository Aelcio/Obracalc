import 'package:obracalc/controller/materialControle.dart';
import 'package:obracalc/controller/materialOrcamentoControle.dart';
import 'package:obracalc/controller/orcamentoControle.dart';
import 'package:obracalc/controller/pessoaControle.dart';
import 'package:obracalc/controller/pfControle.dart';
import 'package:obracalc/controller/pjControle.dart';
import 'package:obracalc/controller/servicoControle.dart';
import 'package:obracalc/controller/servicoOrcamentoControle.dart';
import 'package:obracalc/controller/undmedidaControle.dart';
import 'package:obracalc/controller/usuarioControle.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'obracalc.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(UsuarioControle.tableSql);
      db.execute(ServicoControle.tableSql);
      db.execute(MaterialControle.tableSql);
      db.execute(UndMedidaControle.tableSql);
      db.execute(PessoaControle.tableSql);
      db.execute(pjControle.tableSql);
      db.execute(PfControle.tableSql);
      db.execute(OrcamentoControle.tableSql);
      db.execute(MaterialOrcamentoControle.tableSql);
      db.execute(ServicoOrcamentoControle.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete
  );
}
