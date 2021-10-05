import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';
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

class cadClientes extends StatefulWidget {
  @override
  _cadClientesState createState() => _cadClientesState();
}

class _cadClientesState extends State<cadClientes> {
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
          Editor(_nomeController, 'Nome', '', Icons.person),
          Editor(_celularController, 'Celular', 'Celular',
              Icons.settings_cell_rounded),
          Editor(_telefoneController, 'Telefone', 'Telefone', Icons.phone),
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
                groupValue: null,
                value: null,
                onChanged: null,
              ),
              Text('Pessoa Física'),
              Radio(
                groupValue: null,
                value: null,
                onChanged: null,
              ),
              Text('Pessoa Jurídica'),
            ],
          ),
          Editor(_CPFController, 'CPF', 'CPF', Icons.paste),
          Editor(_CNPJController, 'CNPJ', 'CNPJ', Icons.paste),
          Center(child: Text('ENDEREÇO')),
          Editor(_logradouroController, 'Logradouro', 'Logradouro',
              Icons.where_to_vote_sharp),
          Editor(
              _bairroController, 'Bairro', 'Bairro', Icons.where_to_vote_sharp),
          Editor(
              _cidadeController, 'Cidade', 'Cidade', Icons.where_to_vote_sharp),
          Editor(
              _estadoController, 'Estado', 'Estado', Icons.where_to_vote_sharp),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: _cepController,
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
                onPressed: _cpe,
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
