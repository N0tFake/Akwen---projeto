import 'package:flutter_akwen/app/modulos/registration/registration_Page.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationModule extends Module {
  static String get routeName => '/registration';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegistrationPage()),
  ];
}
