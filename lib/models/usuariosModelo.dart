class Usuario {
  final int idUsuario;
  final String nome;
  final String login;
  final String senha;

  Usuario(this.idUsuario,this.nome, this.login, this.senha);

  @override
  String toString() {
    return 'Usuarios{idUsuario: $idUsuario, nome: $nome, login: $login, senha: $senha}';
  }
}