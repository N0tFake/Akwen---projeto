

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter_akwen/app/modulos/registration/service/registration_service_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationService implements IRegistrationService{
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  RegistrationService({required this.firestore, required this.auth});

  final RegistrationStore store = Modular.get();

  void _addData(){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
    final user = FirebaseAuth.instance.currentUser;
    collectionReference.doc(user?.uid).set({
      'email': store.email,
      'username': store.username
    }).then((value) => print('Adicionado'));
  }

  @override
  Future<bool> cadastrarUser() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: store.email, 
        password: store.password,
      );
      _addData();
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('Senha fraca');
      }else if(e.code == 'email-already-in-use'){
        print('Esse email já existe');
      }
    } catch(e){
      print(e);
    }

    return true;

  }
}