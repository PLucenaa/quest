import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(PerguntaAPP());

class _PerguntaAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Leão', 'Elefante'],
    },
    {
      'texto': 'Qual é seu instrutor favorito?',
      'respostas': ['Maria', 'Kelvin', 'Eduardo', 'Giovana'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: temPerguntaSelecionada
            ? Questionario(
                quandoResponder: _responder,
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas)
            : Resultado(),
      ),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
