import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonLogin extends StatelessWidget {
  final String name;
  final String route;
  const ButtonLogin({Key? key, required this.name, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginStore store = Modular.get();
    Services service = Modular.get();

    final Size screen = MediaQuery.of(context).size;
    return Observer(builder: (_) {
      return TextButton(
          style: TextButton.styleFrom(primary: Colors.white),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
            width: screen.width * 0.4,
            height: screen.height * 0.06,
            child: Center(child: Text(name)),
          ),
          onPressed: () => name == 'Registrar'
              ? Modular.to.navigate(route)
              : service.loginUser(store.email, store.password));
    });
  }
}
