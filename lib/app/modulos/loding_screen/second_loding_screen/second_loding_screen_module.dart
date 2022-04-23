import 'package:flutter_akwen/app/modulos/loding_screen/loding_screen_store.dart';
import 'package:flutter_akwen/app/modulos/loding_screen/second_loding_screen/second_loding_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecondLodingScreenModule extends Module {
  static String get routeName => '/secondLodingScreen'; 
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LodingScreenStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SecondLodingScreenPage()),
  ];
}
