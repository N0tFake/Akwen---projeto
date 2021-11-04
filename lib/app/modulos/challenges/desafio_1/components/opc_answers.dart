import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/enum_opc.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/radio_list_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OpcAnswers extends StatefulWidget {
  const OpcAnswers({ Key? key }) : super(key: key);

  @override
  _OpcAnswersState createState() => _OpcAnswersState();
}

class _OpcAnswersState extends State<OpcAnswers> {
  final Services service = Modular.get();
  Desafio1Store store = Modular.get();

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
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(5)
          )
        ),
        child: FutureBuilder(
          future: service.getChallengeDoc('palavras'),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
            if(snapshot.hasData && !snapshot.data!.exists){
            return const Text('Sem dados');
            }else if(snapshot.connectionState == ConnectionState.done){
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return RadioListTileAnswers(data: data);
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }

  /* void confirm(SingingCharacter? value){
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
  } */
}


