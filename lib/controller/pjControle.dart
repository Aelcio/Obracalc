import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/pjModelo.dart';
import 'package:sqflite/sqflite.dart';

class pjControle {
  static const String tableSql = 'CREATE TABLE pessoa_juridica('
      'idPessoaJuridica INTEGER PRIMARY KEY, '
      'cnpj TEXT, ' +
      'idPessoa INTEGER, FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)) ';

  Future<int> save(pjModelo pj) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> pjMap = Map();
    pjMap['cnpj'] = pj.cnpj;
    pjMap['idPessoa'] = pj.idPessoa;

    return db.insert('pessoa_juridica', pjMap);
  }

  Future<List<pjModelo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('pessoa_juridica');
    final List<pjModelo> pessoas_juridica = [];
    for (Map<String, dynamic> map in result) {
      final pjModelo pj =
      pjModelo(map['idPessoaJuridica'], map['cnpj'], map['idPessoa']);
      pessoas_juridica.add(pj);
    }
    return pessoas_juridica;
  }
}