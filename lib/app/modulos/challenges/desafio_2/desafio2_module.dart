import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_page.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Desafio2Module extends Module {
  static String get routeName => '/desafio2';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Desafio2Store()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const Desafio2Page(challenge: 'defaut',)),
  ];
}
