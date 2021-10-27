
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_module.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_module.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_module.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_akwen/app/modulos/login/login_module.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_module.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Services(
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
    ModuleRoute(HomeModule.routeName, module: HomeModule()),
    ModuleRoute(Desafio1Module.routeName, module: Desafio1Module()),
    ModuleRoute(Desafio2Module.routeName, module: Desafio2Module()),
    ModuleRoute(Desafio3Module.routeName, module: Desafio3Module())
  ];
}
