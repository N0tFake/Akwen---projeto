import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/modulos/login/login_page.dart';
import 'package:flutter_akwen/app/modulos/login/login_repository.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  static String get routeName => '/login';
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginRepository(FirebaseAuth.instance)),
    Bind.lazySingleton((i) => LoginStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
