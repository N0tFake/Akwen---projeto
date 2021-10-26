
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/modulos/login/login_module.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_module.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter_akwen/app/modulos/registration/service/registration_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => RegistrationService(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance
    )),
    Bind.singleton((i) => LoginStore()),
    Bind.singleton((i) => RegistrationStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(RegistrationModule.routeName, module: RegistrationModule()),
  ];
}
