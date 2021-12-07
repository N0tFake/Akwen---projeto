
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_module.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_module.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_module.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_module.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_akwen/app/modulos/loding_screen/loding_screen_module.dart';
import 'package:flutter_akwen/app/modulos/login/login_module.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_module.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_module.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Services(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance
    )),
    Bind.singleton((i) => LoginStore()),
    Bind.singleton((i) => RegistrationStore()),
    Bind.singleton((i) => Desafio1Store()),
    Bind.singleton((i) => ResultadoStore()),
    Bind.singleton((i) => GroupStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LodingScreenModule()),
    ModuleRoute(LoginModule.routeName, module: LoginModule()),
    ModuleRoute(RegistrationModule.routeName, module: RegistrationModule()),
    ModuleRoute(HomeModule.routeName, module: HomeModule()),
    ModuleRoute(Desafio1Module.routeName, module: Desafio1Module()),
    ModuleRoute(Desafio2Module.routeName, module: Desafio2Module()),
    ModuleRoute(Desafio3Module.routeName, module: Desafio3Module()),
    ModuleRoute(ResultadoModule.routeName, module: ResultadoModule()),
    ModuleRoute(GroupModule.routeName, module: GroupModule())
  ];
}
