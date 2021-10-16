import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/pessoaModelo.dart';
import 'package:sqflite/sqflite.dart';

class PessoaControle {
  static const String tableSql = 'CREATE TABLE pessoa('
      'idPessoa INTEGER PRIMARY KEY, '
      'nomePessoa TEXT, '
      'celular TEXT, '
      'telefone TEXT, '
      'logradouro TEXT, '
      'bairro TEXT, '
      'cidade TEXT, '
      'estado TEXT, '
      'cep TEXT )';

  Future<int> save(PessoaModelo pessoa) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> pessoaMap = Map();
    pessoaMap['nomePessoa'] = pessoa.nomePessoa;
    pessoaMap['celular'] = pessoa.celular;
    pessoaMap['telefone'] = pessoa.telefone;
    pessoaMap['logradouro'] = pessoa.logradouro;
    pessoaMap['bairro'] = pessoa.bairro;
    pessoaMap['cidade'] = pessoa.cidade;
    pessoaMap['estado'] = pessoa.estado;
    pessoaMap['cep'] = pessoa.cep;
    return db.insert('pessoa', pessoaMap);
  }

  Future<List<PessoaModelo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('pessoa');
    final List<PessoaModelo> pessoas = [];
    for (Map<String, dynamic> map in result) {
      final PessoaModelo pessoa = PessoaModelo(
          map['idPessoa'],
          map['nomePessoa'],
          map['celular'],
          map['telefone'],
          map['logradouro'],
          map['bairro'],
          map['cidade'],
          map['estado'],
          map['cep'],
      );
      pessoas.add(pessoa);
    }
    return pessoas;
  }
}