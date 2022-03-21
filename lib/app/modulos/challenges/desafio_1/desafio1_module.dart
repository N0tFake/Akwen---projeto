import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_page.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Desafio1Module extends Module {
  static String get routeName => '/desafio1';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Desafio1Store()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const Desafio1Page(challenge: 'defaut',)),
  ];
}
