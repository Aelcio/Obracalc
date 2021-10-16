class PessoaModelo{
  final int idPessoa;
  final String nomePessoa;
  final String celular;
  final String telefone;
  final String logradouro;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;

  PessoaModelo(this.idPessoa, this.nomePessoa, this.celular, this.telefone,
      this.logradouro, this.bairro, this.cidade, this.estado, this.cep);

  @override
  String toString() {
    return 'PessoaModelo{_idPessoa: $idPessoa, _nomePessoa: $nomePessoa, _celular: $celular, _telefone: $telefone, _logradouro: $logradouro, _bairro: $bairro, _estado: $estado, _cep: $cep}';
  }
}