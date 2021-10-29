import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/enum_opc.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OpcAnswers extends StatefulWidget {
  const OpcAnswers({ Key? key }) : super(key: key);

  @override
  _OpcAnswersState createState() => _OpcAnswersState();
}

class _OpcAnswersState extends State<OpcAnswers> {
  Desafio1Store store = Modular.get();
  SingingCharacter? _character = null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(5)
          )
        ),
        child: Column(
          children: [
            RadioListTile(
              title: const Text('Siknõ'),
              value: SingingCharacter.Sikno, 
              groupValue: _character, 
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
                confirm(value);
              }
            ),
            RadioListTile(
              title: const Text('Kuiro'),
              value: SingingCharacter.Kuiro, 
              groupValue: _character, 
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
                confirm(value);
              }
            ),
            RadioListTile(
              title: const Text('Wakrowde'),
              value: SingingCharacter.Wakrowde, 
              groupValue: _character, 
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
                confirm(value);
              }
            ),
            RadioListTile(
              title: const Text('Kni'),
              value: SingingCharacter.Kni, 
              groupValue: _character, 
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
                confirm(value);
              }
            ),
          ],
        ),
      ),
    );
  }

  void confirm(SingingCharacter? value){
    if(store.isChosen == false){
      store.setChosen(true);
    }
    if(value == SingingCharacter.Sikno){
      store.setOpc('Sikno');
    }else if(value == SingingCharacter.Kuiro){
      store.setOpc('Kuiro');
    }else if(value == SingingCharacter.Wakrowde){
      store.setOpc('Wakrowde');
    }else if(value == SingingCharacter.Kni){
      store.setOpc('kni');
    }
  }
}