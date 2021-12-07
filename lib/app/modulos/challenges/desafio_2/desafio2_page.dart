import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Desafio2Page extends StatefulWidget {
  final String title;
  const Desafio2Page({Key? key, this.title = 'Desafio2Page'}) : super(key: key);
  @override
  Desafio2PageState createState() => Desafio2PageState();
}
class Desafio2PageState extends State<Desafio2Page> {
  final Desafio2Store store = Modular.get();
  final Services service = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return FutureBuilder(
        future: service.getChallengeDoc('desafio 1'),
        builder: 
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
            if(snapshot.hasData && !snapshot.data!.exists){
              return const Text('Error');
            }else if(snapshot.connectionState == ConnectionState.done){
              return Text('data');
            }else{
              return const CircularProgressIndicator();
            }
          }
      );
    });
  }
}