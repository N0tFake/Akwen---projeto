import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/components/radio_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GridImages extends StatefulWidget {
  const GridImages({ Key? key,}) : super(key: key);

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
                    listImagens.add(data['Imagens'][store.numPosition]);
                    tirados.add(store.numPosition);
                    repete = true;
                    store.setPosCorrent(i);
                  }else{
                    if(listImagens.isEmpty){
                      num = Random().nextInt(tamanho);
                      listImagens.add(data['Imagens'][num]);
                    }else{
                      do{
                        num = Random().nextInt(tamanho);
                      }while(tirados.contains(num) == true || num == store.numPosition);
                      tirados.add(num);
                      listImagens.add(data['Imagens'][num]);
                    }
                  }
                }
                if(repete == false){
                  listImagens[2] = data['Imagens'][store.numPosition];
                  store.setPosCorrent(2);
                }
                print(listImagens.length);
                return RadioButtons(listImages: listImagens);
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
          }
      );
    });
  }
}