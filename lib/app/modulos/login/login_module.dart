import 'package:flutter_akwen/app/modulos/login/login_page.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {

  static LoginStore loginStore = LoginStore();

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => loginStore),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
