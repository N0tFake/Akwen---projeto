import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetImg extends StatefulWidget {
  const GetImg({ Key? key }) : super(key: key);

  @override
  _GetImgState createState() => _GetImgState();
}

class _GetImgState extends State<GetImg> {

  final Services service = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: FutureBuilder(
        future: service.getUrlImg('desafio 1'),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData && !snapshot.data!.exists){
            return const Text('Sem imagem');
          }else if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Image.network(data['Imagens'][0]);
          } else {
            return const CircularProgressIndicator();
          }
        } 
      ),
    );
  }
}