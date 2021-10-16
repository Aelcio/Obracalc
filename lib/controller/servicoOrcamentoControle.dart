import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/servicoOrcamentoModelo.dart';
import 'package:sqflite/sqflite.dart';

class ServicoOrcamentoControle {
  static const String tableSql = 'CREATE TABLE servicos_orcamento('
      'idOrcamento INTEGER, '
      'idServico INTEGER,'
      'valorServico DOUBLE, '
      'FOREIGN KEY (idOrcamento) REFERENCES orcamentos(idOrcamento)'
      'FOREIGN KEY (idServico)  REFERENCES servicos (idServico))';

  Future<int> save(ServicoOrcamentoModelo servicoorcamento) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> servicoorcamentoMap = Map();
    servicoorcamentoMap ['idOrcamentto'] = servicoorcamento.idOrcamento;
    servicoorcamentoMap ['idServico'] = servicoorcamento.idServico;
    servicoorcamentoMap ['valorServico'] = servicoorcamento.valorServico;

    return db.insert('servicos_orcamento', servicoorcamentoMap);
  }

  Future<List<ServicoOrcamentoModelo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
        'servicos_orcamento');
    final List<ServicoOrcamentoModelo> servicos_orcamento = [];
    for (Map<String, dynamic> map in result) {
      final ServicoOrcamentoModelo servicoorcamento = ServicoOrcamentoModelo(
          map['idOrcamento'],
          map['idServico'],
          map['valorServico']
      );
      servicos_orcamento.add(servicoorcamento);
    }
    return servicos_orcamento;
  }
}
