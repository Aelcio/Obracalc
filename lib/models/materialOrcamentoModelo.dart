class MaterialOrcamentoModelo{
  final int idOrcamento;
  final int idMaterial;
  final double quantidade;
  final double valorUnitario;

  MaterialOrcamentoModelo(
      this.idOrcamento, this.idMaterial, this.quantidade, this.valorUnitario);

  @override
  String toString() {
    return 'MaterialOrcamentoModelo{idOrcamento: $idOrcamento, idMaterial: $idMaterial, quantidade: $quantidade, valorUnitario: $valorUnitario}';
  }
}