import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:obracalc/controller/pessoaControle.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/pessoaModelo.dart';
import 'package:obracalc/models/pfModelo.dart';
import 'package:path/path.dart';
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
// bool value = false;
  int? val;
  bool cpfativo = false;
  bool cnpjativo = false;

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
    final mascaraCelular = new MaskTextInputFormatter(mask: "(##) #####-####");

    //String opEscolhida = "Teste"

    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(title: Text("Cadastro de Clientes")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Editor(_nomeController, 'Nome', '', Icons.person,
                TextInputType.text, TextCapitalization.words),
          ),
          //Editor(_celularController,'Celular','Celular',Icons.settings_cell_rounded, TextInputType.number,TextCapitalization.words),

          //Início Campo Celular com Máscara
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _celularController,
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
                    Icons.settings_cell_rounded,
                    color: Color(0xFF4bacb8),
                  ),
                  labelText: 'Celular',
                  hintText: 'Celular',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                )),
          ),
          //Fim Campo Celular com Máscara

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
                )),
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
                value: 1,
                groupValue: val,
                activeColor: Colors.cyan,
                onChanged: (T) {
                  print(T);
                  setState(() {
                    val = T as int?;
                    cpfativo = true;
                    cnpjativo = false;
                  });
                },
              ),
              Text('Pessoa Física'),
              Radio(
                value: 2,
                groupValue: val,
                activeColor: Colors.cyan,
                onChanged: (T) {
                  print(T);
                  setState(() {
                    val = T as int?;
                    cpfativo = false;
                    cnpjativo = true;
                  });
                },
              ),
              Text('Pessoa Jurídica'),
            ],
          ),
          //Editor(_CPFController, 'CPF', 'CPF', Icons.paste,
          //TextInputType.number, TextCapitalization.words),

          //Início Campo CPF com Máscara
          GestureDetector(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              controller: _CPFController,
              keyboardType: TextInputType.number,
              enabled: cpfativo,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
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
              ),
              onChanged: (_CPFController) {
                if (_CPFController.length >= 14) {
                  validaCPF();
                }
              },
            ),
          )),
          //Fim Campo CPF com Máscara

          //Início Campo CNPJ com Máscara
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _CNPJController,
                keyboardType: TextInputType.number,
                enabled: cnpjativo,
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
                )),
          ),
          //Fim Campo CNPJ com Máscara

          //Editor(_CNPJController, 'CNPJ', 'CNPJ', Icons.paste,
          //TextInputType.number, TextCapitalization.words),
          Center(child: Text('ENDEREÇO')),

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
                    counterText: "",
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
                final String cpf = _CPFController.text;
                final String cnpj = _CNPJController.text;
                final String logradouro = _logradouroController.text;
                final String bairro = _bairroController.text;
                final String cidade = _cidadeController.text;
                final String estado = _estadoController.text;
                final String cep = _cepController.text;
                final PessoaModelo newPessoa = PessoaModelo(
                    0,
                    nome,
                    celular,
                    telefone,
                    cpf,
                    cnpj,
                    logradouro,
                    bairro,
                    cidade,
                    estado,
                    cep);
                _control
                    .save(newPessoa)
                    .then((idPessoa) => Navigator.pop(context));

                _nomeController.clear();
                _celularController.clear();
                _telefoneController.clear();
                _CPFController.clear();
                _CNPJController.clear();
                _logradouroController.clear();
                _bairroController.clear();
                _cidadeController.clear();
                _cidadeController.clear();
                _estadoController.clear();
                _cepController.clear();

                Fluttertoast.showToast(
                    msg: "Cliente cadastrado com sucesso!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black12,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                textStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validaCPF() {
    String _cpf = _CPFController.text;
    if (GetUtils.isCpf(_cpf)) {
      print("CPF Válido");
    } else {
      Fluttertoast.showToast(
          msg: "CPF Inválido",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 20.0);
    }
  }
}
