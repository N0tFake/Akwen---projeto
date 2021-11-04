import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'dart:math';

class GetImg extends StatefulWidget {
  const GetImg({ Key? key }) : super(key: key);

  @override
  _GetImgState createState() => _GetImgState();
}

class _GetImgState extends State<GetImg> {
  final Services service = Modular.get();
  Desafio1Store store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: FutureBuilder(
        future: service.getChallengeDoc('desafio 1'),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData && !snapshot.data!.exists){
            return const Text('Sem imagem');
          }else if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            int tamanho = data['Imagens'].length;
            int numPosition = Random().nextInt(tamanho);
            store.setNumPosition(numPosition);
            return Image.network(data['Imagens'][numPosition]);
          } else {
            return const CircularProgressIndicator();
          }
        } 
      ),
    );
  }
}