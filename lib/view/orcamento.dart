import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obracalc/generic/botoes.dart';
import 'package:obracalc/generic/campos.dart';

class Orcamento extends StatelessWidget {
  final TextEditingController _dataOrcamento = TextEditingController();
  final TextEditingController _clienteOrcamento = TextEditingController();
  final TextEditingController _situacaoOrcamento = TextEditingController();
  final TextEditingController _servicoOrcamento = TextEditingController();
  final TextEditingController _valorServico = TextEditingController();
  final TextEditingController _larguraServico = TextEditingController();
  final TextEditingController _alturaServico = TextEditingController();
  final TextEditingController _materialOrcamento = TextEditingController();
  final TextEditingController _valotTotalOrcamento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orçamento'),
      ),
      body: ListView(
        children: [
          Editor(_dataOrcamento, 'Data', 'Data do Orçamento', Icons.calendar_view_day_outlined),
          Editor(_clienteOrcamento, 'Cliente', 'Cliente', Icons.search),
          Editor(_situacaoOrcamento, 'Situação', 'Situação', Icons.adjust),
          Row(
            children: [Expanded(child:
              Editor(_servicoOrcamento, 'Serviço', 'Serviço', Icons.search),
    ),
              Expanded(child:
              Editor(_valorServico, 'Vlr. Serviço', 'Valor Serviço',
                  Icons.attach_money_rounded),
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
            Editor(_alturaServico, 'altura', 'Altura', Icons.arrow_upward),
            ),
              Expanded(child:
              Editor(_larguraServico, 'Largura', 'Largura',
                  Icons.arrow_forward),
              ),
              ],
          ),
          Editor(_materialOrcamento, 'Material','Material', Icons.adjust),
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
          Editor(_valotTotalOrcamento, 'Valor Total', 'Valor Total', Icons.attach_money),
          Botoes('SALVAR')
        ],
        
      ),
    );
  }
}
