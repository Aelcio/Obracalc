class UnidadeMedida{
  final int idUndMedida;
  final String descricao;
  final String descUndReduzida;

  UnidadeMedida(this.idUndMedida, this.descricao, this.descUndReduzida);

  @override
  String toString() {
    return 'UnidadeMedida{idUndMedida: $idUndMedida, descriacao: $descricao, descUndReduzida: $descUndReduzida}';
  }
}