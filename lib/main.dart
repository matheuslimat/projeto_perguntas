import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

//main() {
//  runApp(new PerguntaApp());
//}

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _indicePergunta = 0;

  void _responder() {
    setState(() {
      _indicePergunta++;
    });
  }

  @override //Sobrescrevendo obrigatoriamente o metodo builder
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'pergunta': 'Qual sua cor favorita?',
        'resposta': ['Preto', 'Vermelho', 'Branco', 'Azul']
      },
      {
        'pergunta': 'Qual é sua idade?',
        'resposta': ['21', '22', '35', '23']
      },
      {
        'pergunta': 'Qual é o seu animal favorito?',
        'resposta': ['Cachorro', 'Gato', 'Girafa', 'Gato']
      },
    ];

    List<String> respostas = perguntas[_indicePergunta]['resposta'];

    // for (var textoResp in respostas) {
    //   widgetsRespostas.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      // O scafold é um widget
      // Scaffold significa estrutura
      home: Scaffold(
        // O appbar é um widget
        appBar: AppBar(
          //n poderiamos fazer title: 'titulo aqui' pq é uma string e n o widget
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_indicePergunta]['pergunta']),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
