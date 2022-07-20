import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IServices{
  Future<void> cadastrarUser(String email, String username, String password);
  Future<void> loginUser(String email, String password);
  Future deslogar();
  Future<DocumentSnapshot> getDataUser(String docUid);
  Future<String> getUidUser();
  Future<DocumentSnapshot> getChallengeDoc(String doc);
  Future<void> deleteAccount(var uid);
}