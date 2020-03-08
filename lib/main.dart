import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

//main() {
//  runApp(new PerguntaApp());
//}

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _indicePergunta = 0;

  final _perguntas = const [
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

  void _responder() {
    setState(() {
      _indicePergunta++;
    });
  }

  // Pra n permitir q ultrapasse o tamanho da lista de perguntas
  bool get temPerguntaSelecionada {
    return _indicePergunta < _perguntas.length;
  }

  @override //Sobrescrevendo obrigatoriamente o metodo builder
  Widget build(BuildContext context) {
    List<String> respostas =
        temPerguntaSelecionada ? _perguntas[_indicePergunta]['resposta'] : null;

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
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_indicePergunta]['pergunta']),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : Center(
                child: Text(
                  'As perguntas acabaram!',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
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
