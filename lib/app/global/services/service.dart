

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/global/services/service_interface.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Services implements IServices{
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  Services({required this.firestore, required this.auth});

  final RegistrationStore registerStore = Modular.get();
  final LoginStore loginStore = Modular.get();

  /// funções do [FirebaseAuth]
  /// [CADASTRAR USUARIO] as funções [_addData] e [cadastrarUser], são usadas para cadastrar usuario 
  void _addData(){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
    final user = FirebaseAuth.instance.currentUser;
    collectionReference.doc(user?.uid).set({
      'email': registerStore.email,
      'username': registerStore.username
    }).then((value) => print('Adicionado'));
  }

  @override
  Future<void> cadastrarUser() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerStore.email, 
        password: registerStore.password,
      );
      _addData();
      Modular.to.navigate('/home');
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('Senha fraca');
      }else if(e.code == 'email-already-in-use'){
        print('Esse email já existe');
      }
    } catch(e){
      print(e);
    }
  }


/// [LOGIN]
  @override
  Future<void> loginUser(String email, String password) async {
    try{
      print('email: ${email}, senha: ${password}');
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      Modular.to.navigate('/home');
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        print('nenhum usuario encontrado');
      }else if(e.code == 'wrong-password'){
        print('Senha errada');
      } 
    } catch(e){
      print(e);
    }
  }
  /// [DESLOGAR]
  Future deslogar() async{
    try{
      await FirebaseAuth.instance.signOut();
      Modular.to.navigate('/');
      print('deslogado');
    } catch(e){
      print('error ao deslogar');
    }
  }

 /// funções do [Firestore]
 Future<String> getUidUser() async{
    try{
      final user = auth.currentUser;
      String userUid = user!.uid;
      return userUid;
    } catch(e){
      print(e);
    }
    return "Error";
 }

 Future<DocumentSnapshot> getDataUser(String docUid) async{
  CollectionReference collectionReference 
    = FirebaseFirestore
      .instance
      .collection('users');

  DocumentSnapshot snapshot = 
    await collectionReference
    .doc(docUid)
    .get();

  return snapshot;
 }

 Future<DocumentSnapshot> getUrlImg(String doc) async{
  CollectionReference collectionReference 
    = FirebaseFirestore
      .instance
      .collection('challenge');

  DocumentSnapshot snapshot = 
    await collectionReference
    .doc(doc)
    .get();

  return snapshot;
 }
}