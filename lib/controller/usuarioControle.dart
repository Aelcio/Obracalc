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

  Future<int> updateUsuario(Usuario usuario) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> usuarioMap = Map();
    usuarioMap['nome'] = usuario.nome;
    usuarioMap['login'] = usuario.login;
    usuarioMap['senha'] = usuario.senha;

    var resultado = await db.update('usuarios', usuarioMap,
      where: 'idUsuario ?',
      whereArgs: [usuario.idUsuario]
    );
    return resultado;
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

  //================================================
  Future<List<Usuario>> GetUser() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM usuarios');
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

    //===============================
  }
    ConsultaLogin(Usuario usuario) async {
      final Database db =  await getDatabase();
      db.rawQuery("SELECT * FROM usuarios WHERE"
          + " login = '" + usuario.login +  "' AND senha ='"
          + usuario.senha + "'");

      return usuario;
    }

    //Teste Listagem
  listarUsuarios() async{
    Database db = await getDatabase();
    String sql ="SELECT login, senha FROM usuarios";

    List listaUsuarios = await db.rawQuery(sql);

    return listaUsuarios;
  }

 }

