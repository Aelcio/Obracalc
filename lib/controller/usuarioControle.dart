import 'package:obracalc/database/app_database.dart';
import 'package:obracalc/models/usuariosModelo.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioControle {
  static const String tableSql = 'CREATE TABLE usuarios('
      'idUsuario INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'login TEXT, '
      'senha TEXT )';

  Future<int> saveUsuario(Usuario usuario) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> usuarioMap = Map();
    usuarioMap['nome'] = usuario.nome;
    usuarioMap['login'] = usuario.login;
    usuarioMap['senha'] = usuario.senha;
    return db.insert('usuarios', usuarioMap);
  }

  Future<List<Usuario>> findAllUsuario() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('usuarios');
    final List<Usuario> usuarios = [];
    for (Map<String, dynamic> map in result) {
      final Usuario usuario = Usuario(
        map['idUsuario'],
        map['nome'],
        map['login'],
        map['senha'],
      );
      usuarios.add(usuario);
    }
    return usuarios;
  }
 }

