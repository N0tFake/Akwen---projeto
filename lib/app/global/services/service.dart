

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
  Future<void> loginUser() async {
    try{
      print(loginStore.email);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginStore.email, 
        password: loginStore.password
      );
      Modular.to.navigate('/home');
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        print('nenhum usuario encontrado');
      }else if(e.code == 'wrong-password'){
        print('Senha errada');
      }
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
 Future getDataUser() async{

 }
}