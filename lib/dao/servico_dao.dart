import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/servicoModelo.dart';
import 'package:obracalc/models/usuariosModelo.dart';
import 'package:sqflite/sqflite.dart';

class ServicoDao {

  static const String tableSql = 'CREATE TABLE servicos('
      'idServico INTEGER PRIMARY KEY, '
      'nomeServico TEXT, '
      'descricao TEXT )';

  Future<int> save(Servico servico) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> servicoMap = Map();
    servicoMap['nomeServico'] = servico.nomeServico;
    servicoMap['descricao'] = servico.descricao;
    return db.insert('servicos', servicoMap);
  }

  Future<List<Servico>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('servicos');
    final List<Servico> servicos = [];
    for (Map<String, dynamic> map in result) {
      final Servico servico= Servico(
        map['idServico'],
        map['nomeServico'],
        map['descricao'],

      );
      servicos.add(servico);
    }
    return servicos;
  }
}
