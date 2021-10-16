import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/pfModelo.dart';
import 'package:sqflite/sqflite.dart';

class PfControle {
  static const String tableSql = 'CREATE TABLE pessoa_fisica('
          'idPessoaFisica INTEGER PRIMARY KEY, '
          'cpf TEXT, ' +
      'idPessoa INTEGER, FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)) ';

  Future<int> save(PfModelo pf) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> pfMap = Map();
    pfMap['cpf'] = pf.cpf;
    pfMap['idPessoa'] = pf.idPessoa;

    return db.insert('pessoa_fisica', pfMap);
  }

  Future<List<PfModelo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('pessoa_fisica');
    final List<PfModelo> pessoas_fisica = [];
    for (Map<String, dynamic> map in result) {
      final PfModelo pf =
          PfModelo(map['idPessoaFisica'], map['cpf'], map['idPessoa']);
      pessoas_fisica.add(pf);
    }
    return pessoas_fisica;
  }
}
