import 'package:flutter_akwen/app/modulos/loding_screen/loding_screen_page.dart';
import 'package:flutter_akwen/app/modulos/loding_screen/loding_screen_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LodingScreenModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LodingScreenStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LodingScreenPage()),
  ];
}
