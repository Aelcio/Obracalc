import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:obracalc/controller/servicoControle.dart';
import 'package:obracalc/generic/campos.dart';
import 'package:obracalc/models/servicoModelo.dart';

class cadServicos extends StatelessWidget {
  final TextEditingController _nomeServico = TextEditingController();
  final TextEditingController _descricaoServico = TextEditingController();
  final ServicoControle _dao = ServicoControle();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Serviços'),),
      body: ListView(
        children: [
          Editor(_nomeServico, 'Nome do Serviço', 'Serviço', Icons.construction, TextInputType.text, TextCapitalization.words),
          Editor(_descricaoServico, 'Descrição', 'Descrição', Icons.construction, TextInputType.text, TextCapitalization.words),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: Text(
                  "Salvar",
                ),
                onPressed: () {
                  final String nomeServico = _nomeServico.text;
                  final String descricao = _descricaoServico.text;
                  final Servico newServico = Servico(0, nomeServico, descricao);
                  _dao.save(newServico).then((idServico)=> Navigator.pop(context));

                  Fluttertoast.showToast(
                      msg: "Serviço cadastrado com sucesso",
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
                    ))),
          ),
        ],
      ),
    );
  }
}
