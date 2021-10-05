class Material {
  final String idMaterial;
  final String descricao;
  final int idUndMedida;
  final double valor;

  Material(this.idMaterial, this.descricao, this.idUndMedida, this.valor);

  @override
  String toString() {
    return 'Material{idMaterial: $idMaterial, descricao: $descricao, idUndMedida: $idUndMedida, valor: $valor}';
  }
}