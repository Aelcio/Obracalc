class UnidadeMedida{
  final int idUndMedida;
  final String descriacao;
  final String descUndReduzida;

  UnidadeMedida(this.idUndMedida, this.descriacao, this.descUndReduzida);

  @override
  String toString() {
    return 'UnidadeMedida{idUndMedida: $idUndMedida, descriacao: $descriacao, descUndReduzida: $descUndReduzida}';
  }
}