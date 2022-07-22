import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/components/radio_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GridImages extends StatefulWidget {
  const GridImages({ Key? key, required this.corrent, required this.challenge}) : super(key: key);
  final int corrent;
  final String challenge;

  @override
  _GridImagesState createState() => _GridImagesState();
}

class _GridImagesState extends State<GridImages> {
  final Services service = Modular.get();
  Desafio2Store store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
       return FutureBuilder(
        future: service.getChallengeDoc('desafio 1'),
        builder: 
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
            if(snapshot.hasData && !snapshot.data!.exists){
                return const Text('Sem dados');
              }else if(snapshot.connectionState == ConnectionState.done){
                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                List<String> listImagens = [];

                int num=0;
                bool repete = false;
                int tamanho = data['Imagens'].length;
                List<int> tirados = [];
                for(var i=0; i<3; i++){
                  if(Random().nextInt(2) == 1 && repete == false){
                    listImagens.add(data['Imagens'][widget.corrent]);
                    tirados.add(widget.corrent);
                    repete = true;
                    store.setPosCorrent(i);
                  }else{
                    if(listImagens.isEmpty){
                      do{
                        num = Random().nextInt(tamanho);
                      }while(num == widget.corrent);
                      listImagens.add(data['Imagens'][num]);
                    }else{
                      do{
                        num = Random().nextInt(tamanho);
                      }while(tirados.contains(num) == true || num == widget.corrent);
                      tirados.add(num);
                      listImagens.add(data['Imagens'][num]);
                    }
                  }
                }
                if(repete == false){
                  listImagens[2] = data['Imagens'][store.numPosition];
                  store.setPosCorrent(2);
                }
                store.answerCorrent = listImagens[store.posCorrent];
                return RadioButtons(listImages: listImagens, challenge: widget.challenge,);
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
          }
      );
    });
  }
}