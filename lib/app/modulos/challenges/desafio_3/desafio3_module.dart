import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_page.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Desafio3Module extends Module {
  static String get routeName => '/desafio3';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Desafio3Store(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const Desafio3Page()),
  ];
}
