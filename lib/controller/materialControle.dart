import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/materialModelo.dart';
import 'package:sqflite/sqflite.dart';

class MaterialControle{
  static const String tableSql = 'CREATE TABLE materiais('
      'idMaterial INTEGER PRIMARY KEY, '
      'descricao TEXT, '
      'valor DOUBLE, ' + 'idUndMedida INTEGER, FOREIGN KEY (idUndMedida) REFERENCES unidademedidas(idUndMedida)) ';

  static const String insertSql = 'INSERT INTO materiais(descricao, idUndMedida, valor) VALUES'
      '("Cimento Saco 50KG" , 2, 29.90),'
      '("Areia" , 4, 95.00),'
      '("Cal Virgem", 2, 9.90), '
      '("Tijolo 6 Furos", 1, 0.44), '
      '("Ferro 5/16", 5, 27.50), '
      '("Ferro 4,2", 5, 9.50),  '
      '("Pedra Brita", 4, 75.00)';

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