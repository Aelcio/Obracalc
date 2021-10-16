class Servico {
  final int _idServico;
  final String _nomeServico;
  final String _descricao;

  Servico(this._idServico, this._nomeServico, this._descricao);

  @override
  String toString() {
    return 'Servico{idServico: $idServico, nomeServico: $nomeServico, descricao: $descricao}';
  }

  String get descricao => _descricao;

  set descricao(String value) {
    descricao = value;
  }

  String get nomeServico => _nomeServico;

  set nomeServico(String value) {
    nomeServico = value;
  }

  int get idServico => _idServico;

  set idServico(int value) {
    idServico = value;
  }
}