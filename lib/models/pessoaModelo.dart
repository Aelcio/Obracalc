class PessoaModelo{
  final int idPessoa;
  final String nomePessoa;
  final String celular;
  final String telefone;
  final String cpf;
  final String cnpj;
  final String logradouro;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;


  PessoaModelo(
      this.idPessoa,
      this.nomePessoa,
      this.celular,
      this.telefone,
      this.cpf,
      this.cnpj,
      this.logradouro,
      this.bairro,
      this.cidade,
      this.estado,
      this.cep);

  @override
  String toString() {
    return 'PessoaModelo{idPessoa: $idPessoa, nomePessoa: $nomePessoa, celular: $celular, cpf: $cpf, cnpj: $cnpj, telefone: $telefone, logradouro: $logradouro, bairro: $bairro, cidade: $cidade, estado: $estado, cep: $cep}';
  }
}