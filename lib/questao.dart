import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(
          50), // Coloca uma margem invisivel em tudo do texto cima baixo esquerda e direita(pra alinhar)
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 22,
          color: Colors.blueGrey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
