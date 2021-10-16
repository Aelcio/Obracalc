class ServicoOrcamentoModelo{
  final int idOrcamento;
  final int idServico;
  final double valorServico;

  ServicoOrcamentoModelo(this.idOrcamento, this.idServico, this.valorServico);

  @override
  String toString() {
    return 'ServicoControleOrcamento{idOrcamento: $idOrcamento, idServico: $idServico, valorServico: $valorServico}';
  }
}