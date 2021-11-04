import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RadioListTileAnswers extends StatefulWidget {
  const RadioListTileAnswers({ Key? key, required this.data }) : super(key: key);
  final Map<String, dynamic> data;

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
          title: Text(widget.data['akwe'][store.numPosition]),
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
          title: const Text('teste'),
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
          title: const Text('teste'),
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
          title: const Text('teste'),
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