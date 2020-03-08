import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './questao.dart';
import './resposta.dart';

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(
      wordPair.asPascalCase,
      style: TextStyle(
        fontSize: 22,
        color: Colors.blue,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int indicePergunta;
  final void Function() responder;

  Questionario(
      {@required
          this.perguntas,
      @required
          this.indicePergunta,
      @required
          this.responder}); // required significa ser obrigatorio passar um parametro e chaves necessita ser passado ao construtor um nome

  // Pra n permitir q ultrapasse o tamanho da lista de perguntas
  bool get temPerguntaSelecionada {
    return indicePergunta < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        temPerguntaSelecionada ? perguntas[indicePergunta]['resposta'] : null;
    return Column(
      children: <Widget>[
        Questao(perguntas[indicePergunta]['pergunta']),
        ...respostas.map((t) => Resposta(t, responder)).toList(),
        RandomWords()
      ],
    );
  }
}
