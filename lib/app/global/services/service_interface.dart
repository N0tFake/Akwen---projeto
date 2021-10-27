import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IServices{
  Future<void> cadastrarUser();
  Future<void> loginUser();
  Future deslogar();
  Future<DocumentSnapshot> getDataUser(String docUid);
  Future<String> getUidUser();
}