import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/orcamentoModelo.dart';

import 'package:sqflite/sqflite.dart';

class OrcamentoControle{
  static const String tableSql = 'CREATE TABLE orcamentos('
      'idOrcamento INTEGER PRIMARY KEY, '
      'data DateTime, '
      'situacao TEXT, '
      'valorTotal DOUBLE, ' + 'idPessoa INTEGER, FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)) ';

  Future<int> save(OrcamentoModelo orcamento) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> orcamentoMap = Map();
    orcamentoMap['data']       = orcamento.data;
    orcamentoMap['situacao']   = orcamento.situacao;
    orcamentoMap['idPessoa']   = orcamento.idPessoa;
    orcamentoMap['valorTotal'] = orcamento.valorTotal;
    return db.insert('orcamentos', orcamentoMap);
  }

  Future<List<OrcamentoModelo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('orcamentos');
    final List<OrcamentoModelo> orcamentos = [];
    for (Map<String, dynamic> map in result) {
      final OrcamentoModelo orcamento = OrcamentoModelo(
          map['idOrcamento'],
          map['data'],
          map['situacao'],
          map['idPesoa'],
          map['valotTotal']
      );
      orcamentos.add(orcamento);
    }
    return orcamentos;
  }
}