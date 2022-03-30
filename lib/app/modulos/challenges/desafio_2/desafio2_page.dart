import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/components/page_desafio.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Desafio2Page extends StatefulWidget {
  final String title;
  final String challenge;
  const Desafio2Page({Key? key, this.title = 'Desafio2Page', required this.challenge}) : super(key: key);
  @override
  Desafio2PageState createState() => Desafio2PageState();
}
class Desafio2PageState extends State<Desafio2Page> {
  final Desafio2Store store = Modular.get();
  final Services service = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      if(widget.challenge == 'desafio1'){
        return FutureBuilder(
          future: service.getChallengeDoc('palavras'),
          builder: 
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(snapshot.hasData && !snapshot.data!.exists){
                return const Text('Error');
              }else if(snapshot.connectionState == ConnectionState.done){
                Map<String, dynamic> data = 
                  snapshot.data!.data() as Map<String, dynamic>;
                return PageDesafio02(data: data, challenge: 'desafio1',);
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }
        );
      }else if(widget.challenge == 'desafio2'){
        return FutureBuilder(
          future: service.getChallengeDoc('palavras'),
          builder: 
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(snapshot.hasData && !snapshot.data!.exists){
                return const Text('Error');
              }else if(snapshot.connectionState == ConnectionState.done){
                Map<String, dynamic> data = 
                  snapshot.data!.data() as Map<String, dynamic>;
                return PageDesafio02(data: data, challenge: 'desafio2',);
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }
        );
      }
      return const Text('Error');
    });
  }
}