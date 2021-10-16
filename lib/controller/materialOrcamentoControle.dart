import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/materialOrcamentoModelo.dart';
import 'package:obracalc/models/orcamentoModelo.dart';

import 'package:sqflite/sqflite.dart';

class MaterialOrcamentoControle{
  static const String tableSql = 'CREATE TABLE materiais_orcamento('
      'quantidade DOUBLE, '
      'valorUnitario DOUBLE,'
      'idOrcamento INTEGER, '
      'idMaterial  INTEGER, '
      'FOREIGN KEY (idOrcamento) REFERENCES orcamentos(idOrcamento)'
      'FOREIGN KEY (idMaterial)  REFERENCES materiais (idMaterial))';

  Future<int> save(MaterialOrcamentoModelo matreialorcamento) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> materialorcamentoMap = Map();
    materialorcamentoMap ['idOrcamentto']       = matreialorcamento.idOrcamento;
    materialorcamentoMap ['idMaterial']       = matreialorcamento.idMaterial;
    materialorcamentoMap ['quantidade']   = matreialorcamento.quantidade;
    materialorcamentoMap ['valorUnitario'] = matreialorcamento.valorUnitario;

    return db.insert('materiais_orcamento', materialorcamentoMap);
  }

  Future<List<MaterialOrcamentoModelo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('materiais_orcamento');
    final List<MaterialOrcamentoModelo> materiais_orcamento = [];
    for (Map<String, dynamic> map in result) {
      final MaterialOrcamentoModelo materialorcamento = MaterialOrcamentoModelo(
          map['idOrcamento'],
          map['idMaterial'],
          map['quantidade'],
          map['valorUnitario']
      );
      materiais_orcamento.add(materialorcamento);
    }
    return materiais_orcamento;
  }

}