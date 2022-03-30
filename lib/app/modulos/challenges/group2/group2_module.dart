import 'package:flutter_akwen/app/modulos/challenges/group2/group2_Page.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Group2Module extends Module {
  static String get routeName => '/group2';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Group2Store()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const Group2Page()),
  ];
}
