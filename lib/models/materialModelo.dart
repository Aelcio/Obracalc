class  MaterialModelo {
  final int _idMaterial;
  final String _descricao;
  final int _idUndMedida;
  final double _valor;

  MaterialModelo(this._idMaterial, this._descricao, this._idUndMedida, this._valor);

  @override
  String toString() {
    return 'MaterialModelo{idMaterial: $idMaterial, descricaoMaterial: $descricao, idUndMedida: $idUndMedida, valor: $valor}';
  }

  double get valor => _valor;

  set valor(double value) {
    valor = value;
  }

  int get idUndMedida => _idUndMedida;

  set idUndMedida(int value) {
    idUndMedida = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    descricao = value;
  }

  int get idMaterial => _idMaterial;

  set idMaterial(int value) {
    idMaterial = value;
  }
}