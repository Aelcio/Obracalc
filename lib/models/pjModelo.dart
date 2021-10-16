class pjModelo{
  final int idPessoaJuridica;
  final int idPessoa;
  final String cnpj;

  pjModelo(this.idPessoaJuridica, this.idPessoa, this.cnpj);

  @override
  String toString() {
    return 'pjModelo{idPj: $idPessoaJuridica, idPessoa: $idPessoa, CPF: $cnpj}';
  }
}