import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetDoc extends StatefulWidget {
  const GetDoc({ Key? key }) : super(key: key);

  @override
  State<GetDoc> createState() => _GetDocState();
}

class _GetDocState extends State<GetDoc> {
  final Services service = Modular.get();
  Desafio3Store store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: FutureBuilder(
        future: service.getChallengeDoc('Desafio03'),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData && !snapshot.data!.exists){
            return const Text('Sem dados');
          }else if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            final phrase = data['frases'];
            return phrase;
          } else {
            return const CircularProgressIndicator();
          }
        } 
      ),
    );
  }
}