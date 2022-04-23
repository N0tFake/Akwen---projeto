import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/radio_list_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OpcAnswers extends StatefulWidget {
  final String challenge;
  const OpcAnswers({ Key? key, required this.challenge }) : super(key: key);

  @override
  _OpcAnswersState createState() => _OpcAnswersState();
}

class _OpcAnswersState extends State<OpcAnswers> {
  final Services service = Modular.get();
  Desafio1Store store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            
            int num=0;
            bool repete = false;
            int tamanho = data['akwe'].length;
            List palavras = [];
            for(var i=0; i<3; i++){
              do{
                do{
                  num = Random().nextInt(tamanho);
                }while(num == store.numPosition);
              }while(palavras.contains(num));

              palavras.add(num);

              if(Random().nextInt(2) == 1 && repete == false){
                repete = true;
                palavras.add(store.numPosition);  
              }else if(repete == false && i == 2){
                repete = true;
                palavras.add(store.numPosition);
              }
            }
            return RadioListTileAnswers(challenge: widget.challenge, data: data, palavras: palavras,);
          } else {
            return Center(child: Row(
              children: const [
                Text('Carrengando', style: TextStyle(
                  fontFamily: 'Nunito', 
                  fontSize: 20, 
                  fontWeight: FontWeight.w600
                )),
                CircularProgressIndicator(color: redColor)
              ],
            ));
          }
        },
      ),
    );
  }
}


