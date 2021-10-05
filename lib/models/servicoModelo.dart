class Servico {
  final int idServico;
  final String nomeServico;
  final String descricao;

  Servico(this.idServico, this.nomeServico, this.descricao);

  @override
  String toString() {
    return 'Servico{idServico: $idServico, nomeServico: $nomeServico, descricao: $descricao}';
  }
}