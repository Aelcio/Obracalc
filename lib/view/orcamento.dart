import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obracalc/generic/botoes.dart';
import 'package:obracalc/generic/campos.dart';

class Orcamento extends StatefulWidget {
  @override
  State<Orcamento> createState() => _OrcamentoState();
}

class _OrcamentoState extends State<Orcamento> {
  final TextEditingController _dataOrcamento = TextEditingController();

  final TextEditingController _clienteOrcamento = TextEditingController();

  final TextEditingController _situacaoOrcamento = TextEditingController();

  final TextEditingController _servicoOrcamento = TextEditingController();

  final TextEditingController _valorServico = TextEditingController();

  final TextEditingController _larguraServico = TextEditingController();

  final TextEditingController _alturaServico = TextEditingController();

  final TextEditingController _materialOrcamento = TextEditingController();

  final TextEditingController _valotTotalOrcamento = TextEditingController();

  String value = items.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orçamento'),
      ),
      body: ListView(
        children: [
          Editor(_dataOrcamento, 'Data', 'Data do Orçamento', Icons.calendar_view_day_outlined, TextInputType.datetime, TextCapitalization.words),
          Editor(_clienteOrcamento, 'Cliente', 'Cliente', Icons.search, TextInputType.text, TextCapitalization.words),
          //Editor(_situacaoOrcamento, 'Situação', 'Situação', Icons.adjust),

          //Combobox
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(color: Colors.black54),
              ),

              child: DropdownButton<String>(
                value: value,
                items: items.map((item) => DropdownMenuItem<String>(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,

                      ),
                    ),
                  ),
                  value: item,
                ))
                    .toList(),
                onChanged: (value) => setState((){
                  this.value = value!;
                }),
              ),
            ),
          ),
          //========
          Row(
            children: [Expanded(child:
              Editor(_servicoOrcamento, 'Serviço', 'Serviço', Icons.search, TextInputType.text, TextCapitalization.words),
    ),
              Expanded(child:
              Editor(_valorServico, 'Vlr. Serviço', 'Valor Serviço',
                  Icons.attach_money_rounded, TextInputType.number, TextCapitalization.words),
              )
            ],
          ),
          Center(
            child: Text(
              'Digite as dimensões do Serviço em MT²',
            ),
          ),
          Row(
            children: [Expanded(child:
            Editor(_alturaServico, 'altura', 'Altura', Icons.arrow_upward, TextInputType.number, TextCapitalization.words),
            ),
              Expanded(child:
              Editor(_larguraServico, 'Largura', 'Largura',
                  Icons.arrow_forward, TextInputType.number, TextCapitalization.words),
              ),
              ],
          ),
          Editor(_materialOrcamento, 'Material','Material', Icons.search,TextInputType.text, TextCapitalization.words),
          Center(
            child: Text(
              'Forma de Assentamento',
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
              Text('Deitado'),
              Radio(
                groupValue: null,
                value: null,
                onChanged: null,
              ),
              Text('Deitado')
            ],
          ),
          Botoes('Calcular'),Center(
            child: Text(
              'RESULTADO',
            ),
          ),

          DataTable(

            columns: [
              DataColumn(label: Text('Descrição')),
              DataColumn(label: Text('Qtde')),
              DataColumn(label: Text('Valor')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Muro')),
                DataCell(Text('50,00')),
                DataCell(Text('1.500,00')),
              ]),
              DataRow(cells: [
                DataCell(Text('Tijolo')),
                DataCell(Text('1.573,00')),
                DataCell(Text('692,34')),
              ]),
              DataRow(cells: [
                DataCell(Text('Cimento')),
                DataCell(Text('15,00')),
                DataCell(Text('435,00')),
              ])
            ],
              ),
          Editor(_valotTotalOrcamento, 'Valor Total', 'Valor Total', Icons.attach_money, TextInputType.number, TextCapitalization.words),
          Botoes('SALVAR')
        ],

      ),
    );
  }
}

final List<String> items = <String>[
  'Pendente                                                             ',
  'Finalizado'
];