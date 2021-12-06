import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FutureDataUsername extends StatefulWidget {
  const FutureDataUsername({ Key? key }) : super(key: key);

  @override
  _FutureDataUsernameState createState() => _FutureDataUsernameState();
}

class _FutureDataUsernameState extends State<FutureDataUsername> {

  final Services service = Modular.get();
  final uid = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.getDataUser(uid!.uid),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if(snapshot.hasData && !snapshot.data!.exists){
          return const Text('Sem usename');
        }else if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['username']}');
        } else {
          return const Text('Loding ...');
        }
      } 
    );
  }
}