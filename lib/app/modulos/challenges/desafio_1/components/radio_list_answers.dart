import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RadioListTileAnswers extends StatefulWidget {
  const RadioListTileAnswers({ Key? key, required this.data, required this.palavras }) : super(key: key);
  final Map<String, dynamic> data;
  final List palavras;

  @override
  _RadioListTileAnswersState createState() => _RadioListTileAnswersState();
}

class _RadioListTileAnswersState extends State<RadioListTileAnswers> {
  
  Desafio1Store store = Modular.get();
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    String value0 = widget.data['akwe'][widget.palavras[0]];
    List<String> value = [
      widget.data['akwe'][widget.palavras[0]], 
      widget.data['akwe'][widget.palavras[1]],
      widget.data['akwe'][widget.palavras[2]],
      widget.data['akwe'][widget.palavras[3]],
    ];
    return Column(
      children: [
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[0]]),
          value: value[0], 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            store.isChosen = true;
            store.opcEscolhida = value.toString();
          }
        ),
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[1]]),
          value: value[1], 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            store.isChosen = true;
            store.opcEscolhida = value.toString();
          }
        ),
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[2]]),
          value: value[2], 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            store.isChosen = true;
            store.opcEscolhida = value.toString();
          }
        ),
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[3]]),
          value: value[3], 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            store.isChosen = true;
            store.opcEscolhida = value.toString();
          }
        )
      ]
    );
  }
}