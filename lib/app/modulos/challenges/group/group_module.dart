import 'package:flutter/cupertino.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_Page.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GroupModule extends Module {
  static String get routeName => '/group';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GroupStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => GroupPage()),
  ];
}
