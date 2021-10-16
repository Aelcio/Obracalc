import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/materialModelo.dart';
import 'package:sqflite/sqflite.dart';

class MaterialControle{
  static const String tableSql = 'CREATE TABLE materiais('
      'idMaterial INTEGER PRIMARY KEY, '
      'descricao TEXT, '
      'valor DOUBLE, ' + 'idUndMedida INTEGER, FOREIGN KEY (idUndMedida) REFERENCES unidademedidas(idUndMedida)) ';

  Future<int> save(MaterialModelo material) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> materialMap = Map();
    materialMap['descricao']   = material.descricao;
    materialMap['idUndMedida'] = material.idUndMedida;
    materialMap['valor']       = material.valor;
    return db.insert('materiais', materialMap);
  }

  Future<List<MaterialModelo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('materiais');
    final List<MaterialModelo> materiais = [];
    for (Map<String, dynamic> map in result) {
      final MaterialModelo material = MaterialModelo(
        map['idMaterial'],
        map['descricao'],
        map['idUndMedida'],
        map['valor']
      );
      materiais.add(material);
    }
    return materiais;
  }

}