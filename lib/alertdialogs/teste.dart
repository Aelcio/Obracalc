import 'package:flutter/material.dart';

showAlertDialog1(BuildContext context) {
  // configura o button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {},
  );


  AlertDialog alerta = AlertDialog(
    title: Text("Cep Não Encontrado"),
    content: Text("Não perca a promoção."),
    actions: [
      okButton,
    ],
  );
}