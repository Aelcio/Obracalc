import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obracalc/controller/pessoaControle.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/pessoaModelo.dart';
import 'package:search_cep/search_cep.dart';

final TextEditingController _nomeController = TextEditingController();
final TextEditingController _celularController = TextEditingController();
final TextEditingController _telefoneController = TextEditingController();
final TextEditingController _CPFController = TextEditingController();
final TextEditingController _CNPJController = TextEditingController();
final TextEditingController _logradouroController = TextEditingController();
final TextEditingController _bairroController = TextEditingController();
final TextEditingController _cidadeController = TextEditingController();
final TextEditingController _estadoController = TextEditingController();
final TextEditingController _cepController = TextEditingController();
final PessoaControle _control = PessoaControle();

class cadClientes extends StatefulWidget {
  @override
  _cadClientesState createState() => _cadClientesState();
}

class _cadClientesState extends State<cadClientes> {
  int valor = 0;

  void _cpe() async {
    // Variáveis que receberão os dados do WebService
    String _bairro;
    String _cidade;
    String _cep;
    String _uf;
    String _endereco;
    final viaCepSearchCep = ViaCepSearchCep();
    _cep = _cepController.text;

    final infoCepJSON = await ViaCepSearchCep.searchInfoByCep(cep: '$_cep');

    // variáveis recebendo os dados em JSON da API
    _bairro = infoCepJSON.bairro;
    _endereco = infoCepJSON.logradouro;
    _cidade = infoCepJSON.localidade;
    _uf = infoCepJSON.uf;

// controller recebendo os dados das variáveis
    _logradouroController.text = _endereco;
    _bairroController.text = _bairro;
    _cidadeController.text = _cidade;
    _estadoController.text = _uf;
  }

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(title: Text("Cadastro de Clientes")),
      body: ListView(
        children: [
          Editor(_nomeController, 'Nome', '', Icons.person, TextInputType.text,
              TextCapitalization.words),
          Editor(_celularController,'Celular','Celular',Icons.settings_cell_rounded, TextInputType.number,TextCapitalization.words),

          //Início Campo Telefone com Máscara
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _telefoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                decoration: InputDecoration(
                  //enabledBorder: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF4bacb8),
                  ),
                  labelText: 'Telefone',
                  hintText: 'Telefone',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                )
            ),
          ),
          //Fim Campo Telefone com Máscara

          //Editor(_telefoneController, 'Telefone', 'Telefone', Icons.phone, TextInputType.number, TextCapitalization.words,),
          Center(
            child: Text(
              'DOCUMENTOS',
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                groupValue: 1,
                value: valor,
                onChanged: (int? vl) {
                  //print(vl);
                  setState(() {
                    valor = 0;
                  });
                },
              ),
              Text('Pessoa Física'),
              Radio(
                groupValue: 1,
                value: null,
                onChanged: null,
              ),
              Text('Pessoa Jurídica'),
            ],
          ),
          //Editor(_CPFController, 'CPF', 'CPF', Icons.paste,
              //TextInputType.number, TextCapitalization.words),

          //Início Campo CPF com Máscara
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _CPFController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
                decoration: InputDecoration(
                  //enabledBorder: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.paste,
                    color: Color(0xFF4bacb8),
                  ),
                  labelText: 'CPF',
                  hintText: 'CPF',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                )
            ),
          ),
          //Fim Campo CNPJ com Máscara

          //Início Campo CPF com Máscara
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _CNPJController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnpjInputFormatter()
                ],
                decoration: InputDecoration(
                  //enabledBorder: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.paste,
                    color: Color(0xFF4bacb8),
                  ),
                  labelText: 'CNPJ',
                  hintText: 'CNPJ',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                )
            ),
          ),
          //Fim Campo CNPJ com Máscara

          //Editor(_CNPJController, 'CNPJ', 'CNPJ', Icons.paste,
              //TextInputType.number, TextCapitalization.words),
          Center(child: Text('ENDEREÇO')),
          Editor(
              _logradouroController,
              'Logradouro',
              'Logradouro',
              Icons.where_to_vote_sharp,
              TextInputType.text,
              TextCapitalization.words),
          Editor(
              _bairroController,
              'Bairro',
              'Bairro',
              Icons.where_to_vote_sharp,
              TextInputType.text,
              TextCapitalization.words),
          Editor(
              _cidadeController,
              'Cidade',
              'Cidade',
              Icons.where_to_vote_sharp,
              TextInputType.text,
              TextCapitalization.words),
          Editor(
              _estadoController,
              'Estado',
              'Estado',
              Icons.where_to_vote_sharp,
              TextInputType.text,
              TextCapitalization.words),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: _cepController,
                  //inputFormatters: [
                    ///FilteringTextInputFormatter.digitsOnly,
                    //(),
                  //],
                  maxLength: 8,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.where_to_vote,
                      color: Color(0xFF4bacb8),
                    ),
                    labelText: 'CEP',
                    hintText: 'CEP',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (_cepController) {
                    if (_cepController.length >= 8) {
                      _cpe();
                    }
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Salvar",
                ),
                onPressed: () {
                  final String nome = _nomeController.text;
                  final String celular = _celularController.text;
                  final String telefone = _telefoneController.text;
                  final String logradouro = _logradouroController.text;
                  final String bairro = _bairroController.text;
                  final String cidade = _cidadeController.text;
                  final String estado = _estadoController.text;
                  final String cep = _cepController.text;
                  final PessoaModelo newPessoa = PessoaModelo(0, nome, celular,
                      telefone, logradouro, bairro, cidade, estado, cep);
                  _control
                      .save(newPessoa)
                      .then((idMaterial) => Navigator.pop(context));
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                    textStyle: TextStyle(
                      fontSize: 18,
                    ))),
          ),
        ],
      ),
    );
  }
}
