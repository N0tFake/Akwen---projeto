import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_services.dart';

class RegistrationRepository extends RegistrationService {

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  RegistrationRepository({required this.auth, required this.firestore});

  Future<bool> register(String email, String username, String password) async {
    try{
      QuerySnapshot snap = await FirebaseFirestore
        .instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
        
      if(snap.size > 0) {
        return false;
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      _addData(email, username);
      return true;
    } on FirebaseAuthException catch(e){
      if(e.code == 'email-already-in-use'){
        throw Exception('Email já cadastrado');
      } else {
        throw Exception('Ouve um erro: ${e.code}');
      }
    } 
  }

  void _addData(String email, String username){
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
    final user = FirebaseAuth.instance.currentUser;
    collectionReference.doc(user?.uid).set({
      'email': email,
      'username': username
    }).then((value) => print('Adicionado'));
  }

}