import 'package:flutter/material.dart';
import 'package:obracalc/generic/campos.dart';

final TextEditingController _nome = TextEditingController();
final TextEditingController _celular = TextEditingController();
final TextEditingController _telefone = TextEditingController();
final TextEditingController _CPF = TextEditingController();
final TextEditingController _CNPJ = TextEditingController();
final TextEditingController _logradouro = TextEditingController();
final TextEditingController _bairro = TextEditingController();
final TextEditingController _cidade = TextEditingController();
final TextEditingController _estado = TextEditingController();
final TextEditingController _cep = TextEditingController();

class alteraClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(title: Text("Cadastro de Clientes")),
      body: ListView(
        children: [
          Editor(_nome, 'Nome', '', Icons.person, TextInputType.text, TextCapitalization.words),
          Editor(_celular, 'Celular', 'Celular', Icons.settings_cell_rounded, TextInputType.number, TextCapitalization.words),
          Editor(_telefone, 'Telefone', 'Telefone', Icons.phone, TextInputType.number, TextCapitalization.words),
          Center(
            child: Text(
              'DOCUMENTOS',
            ),
          ),
          Editor(_CPF, 'CPF', 'CPF', Icons.paste, TextInputType.number, TextCapitalization.words),
          Editor(_CNPJ, 'CNPJ', 'CNPJ', Icons.paste, TextInputType.number, TextCapitalization.words),
          Center(child: Text('ENDEREÇO')),
          Editor(_logradouro, 'Logradouro', 'Logradouro', Icons.paste, TextInputType.text, TextCapitalization.words),
          Editor(_bairro, 'Bairro', 'Bairro', Icons.home, TextInputType.text, TextCapitalization.words),
          Editor(_cidade, 'Cidade', 'Cidade', Icons.home, TextInputType.text, TextCapitalization.words),
          Editor(_estado, 'Estado', 'Estado', Icons.home, TextInputType.text, TextCapitalization.words),
          Editor(_cep, 'CEP', 'CEP', Icons.home, TextInputType.number, TextCapitalization.words),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Alterar",
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12.0),
                    textStyle: TextStyle(
                      fontSize: 18,
                    ))),
          ),
        ],
      ),
    );
  }
}
