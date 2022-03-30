import 'package:flutter_akwen/app/modulos/resultado/resultado_Page.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResultadoModule extends Module {
  static String get routeName => '/resultado';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ResultadoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ResultadoPage(challenge: 'defaut')),
  ];
}
