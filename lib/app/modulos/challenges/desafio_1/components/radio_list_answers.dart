import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RadioListTileAnswers extends StatefulWidget {
  const RadioListTileAnswers({ Key? key, required this.data, required this.palavras, required this.challenge }) : super(key: key);
  final String challenge;
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

    List<String> value = [];
   
    if(widget.challenge == 'desafio1'){
      value.add(widget.data['akwe'][widget.palavras[0]]);
      value.add(widget.data['akwe'][widget.palavras[1]]);
      value.add(widget.data['akwe'][widget.palavras[2]]);
      value.add(widget.data['akwe'][widget.palavras[3]]);
    }else if(widget.challenge == 'desafio2'){
      value.add(widget.data['ptbr'][widget.palavras[0]]);
      value.add(widget.data['ptbr'][widget.palavras[1]]);
      value.add(widget.data['ptbr'][widget.palavras[2]]);
      value.add(widget.data['ptbr'][widget.palavras[3]]);
    }

    value.add('error');

    return Column(
      children: [
        RadioListTile(
          title: Text(value[0]),
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
          title: Text(value[1]),
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
          title: Text(value[2]),
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
          title: Text(value[3]),
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