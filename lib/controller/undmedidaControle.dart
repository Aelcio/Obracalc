import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/undmedidaModelo.dart';
import 'package:sqflite/sqflite.dart';

class UndMedidaControle{
  static const String tableSql = 'CREATE TABLE unidademedidas('
      'idUndMedida INTEGER PRIMARY KEY, '
      'descricao TEXT, '
      'descReduzida TEXT )';

  static const String insertSql = 'INSERT INTO unidademedidas (descricao, descReduzida) VALUES'
      '("Unidade" ,"UN"),'
      '("Sacos" ,"SC"),'
      '("Metro Quadrado", "M²"), '
      '("Metro Cúbico", "M³"), '
      '("Barra", "BR"), '
      '("Lata", "LT")  ';

  Future<int> save(UnidadeMedida undmedida) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> undmedidaMap = Map();
    undmedidaMap['descricao'] = undmedida.descricao;
    undmedidaMap['descReduzida'] = undmedida.descUndReduzida;
    return db.insert('unidademedidas', undmedidaMap);
  }

  Future<List<UnidadeMedida>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('unidademedidas');
    final List<UnidadeMedida> unidademedidas = [];
    for (Map<String, dynamic> map in result) {
      final UnidadeMedida medida = UnidadeMedida (
        map['idUndMedida'],
        map['descricao'],
        map['descReduzida'],

      );
      unidademedidas.add(medida);
    }
    return unidademedidas;
  }
}