class PfModelo{
  final int idPessoaFisica;
  final int idPessoa;
  final String cpf;

  PfModelo(this.idPessoaFisica, this.idPessoa, this.cpf);

  @override
  String toString() {
    return 'pjModelo{idPj: $idPessoaFisica, idPessoa: $idPessoa, CPF: $cpf}';
  }
}