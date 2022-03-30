import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/page_desafio.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Desafio1Page extends StatefulWidget {
  final String title;
  final String challenge;
  const Desafio1Page({Key? key, this.title = 'Desafio1Page', required this.challenge}) : super(key: key);
  @override
  Desafio1PageState createState() => Desafio1PageState();
}

class Desafio1PageState extends State<Desafio1Page> {
  final Services service = Modular.get();
  final Desafio1Store store = Modular.get();
  final GroupStore storeGroup = Modular.get();

  final ResultadoStore storeResult = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if(widget.challenge == 'desafio1'){
        return FutureBuilder(
          future: service.getChallengeDoc('palavras'),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text('Sem dados');
            } else if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              int tamanho = data['ptbr'].length;
              int numPosition = Random().nextInt(tamanho);
              store.numPosition = numPosition;
              return PageDesafio(data: data, challenge: widget.challenge,);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      }else if(widget.challenge == 'desafio2'){
        return FutureBuilder(
          future: service.getChallengeDoc('palavras'),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text('Sem dados');
            } else if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              int tamanho = data['ptbr'].length;
              int numPosition = Random().nextInt(tamanho);
              store.numPosition = numPosition;
              return PageDesafio(data: data, challenge: widget.challenge,);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      }
      return const Text('error');
    });
  }
}
