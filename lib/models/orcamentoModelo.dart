class OrcamentoModelo{
  final int idOrcamento;
  final DateTime data;
  final String situacao;
  final int idPessoa;
  final double valorTotal;

  OrcamentoModelo(this.idOrcamento, this.data, this.situacao, this.idPessoa,
      this.valorTotal);

  @override
  String toString() {
    return 'OrcamentoModelo{idOrcamento: $idOrcamento, data: $data, situacao: $situacao, idCliente: $idPessoa, valorTotal: $valorTotal}';
  }
}