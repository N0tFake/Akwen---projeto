import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_Page.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_repository.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationModule extends Module {
  static String get routeName => '/registration';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationRepository(
      auth: FirebaseAuth.instance, 
      firestore: FirebaseFirestore.instance
    )),
    Bind.lazySingleton((i) => RegistrationStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegistrationPage()),
  ];
}
