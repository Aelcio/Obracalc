class Usuario {
  final int _idUsuario;
  final String _nome;
  final String _login;
  final String _senha;

  Usuario(this._idUsuario,this._nome, this._login, this._senha);

  @override
  String toString() {
    return 'Usuarios{idUsuario: $idUsuario, nome: $nome, login: $login, senha: $senha}';
  }

  String get senha => _senha;

  set senha(String value) {
    senha = value;
  }

  String get login => _login;

  set login(String value) {
    login = value;
  }

  String get nome => _nome;

  set nome(String value) {
    nome = value;
  }

  int get idUsuario => _idUsuario;

  set idUsuario(int value) {
    idUsuario = value;
  }
}