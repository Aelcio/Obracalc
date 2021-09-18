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

class cadClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(title: Text("Clientes")),
      body: ListView(
        children: [
          Editor(_nome, 'Nome', '', Icons.person),
          Editor(_celular, 'Celular', 'Celular', Icons.settings_cell_rounded),
          Editor(_telefone, 'Telefone', 'Telefone', Icons.phone),
          Center(
            child: Text(
              'DOCUMENTOS',
            ),
          ),
          Editor(_CPF, 'CPF', 'CPF', Icons.paste),
          Editor(_CNPJ, 'CNPJ', 'CNPJ', Icons.paste),
          Center(child: Text('ENDEREÇO')),
          Editor(_logradouro, 'Logradouro', 'Logradouro', Icons.paste),
          Editor(_bairro, 'Bairro', 'Bairro', Icons.home),
          Editor(_cidade, 'Cidade', 'Cidade', Icons.home),
          Editor(_estado, 'Estado', 'Estado', Icons.home),
          Editor(_cep, 'CEP', 'CEP', Icons.home),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Salvar",
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
