import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/modulos/login/login_service.dart';

class LoginRepository extends LoginService {

  final FirebaseAuth auth;
  LoginRepository(this.auth, {authInstace});

  /// [LOGIN]
  @override
  Future<bool> login(String email, String password) async {
    try{
      if(!email.contains('@')){
        QuerySnapshot snap = await FirebaseFirestore
          .instance
          .collection('users')
          .where('username', isEqualTo: email)
          .get();

        if(snap.size > 0){
          email = snap.docs[0].get('email');
        }
      } 
      /* print('email: ${email}, senha: ${password}'); */
      await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return true;
    } on FirebaseAuthException catch(e){
      if(e.code == 'wrong-password' 
        || e.code == 'user-not-found' 
        || e.code == 'invalid-email'){
        throw Exception("E-mail ou senha incorretos");
      } else {
        throw Exception('Ouve um error!');
      } 
    } 
  }
}