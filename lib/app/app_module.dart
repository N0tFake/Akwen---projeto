import 'package:flutter_akwen/app/modulos/login/login_module.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  static LoginStore loginStore = LoginStore();

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => loginStore),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}
