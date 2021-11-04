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
    return Column(
      children: [
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[0]]),
          value: 'valor tirado', 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            print(value);
          }
        ),
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[1]]),
          value: 'teste2', 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            print(value);
          }
        ),
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[2]]),
          value: 'teste2', 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            print(value);
          }
        ),
        RadioListTile(
          title: Text(widget.data['akwe'][widget.palavras[3]]),
          value: 'teste2', 
          groupValue: groupValue, 
          onChanged: (value) {
            setState(() {
              groupValue = value as String?;
            });
            print(value);
          }
        )
      ]
    );
  }
}