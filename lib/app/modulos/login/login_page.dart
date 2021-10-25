

import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/login/components/buttons/button.dart';
import 'package:flutter_akwen/app/modulos/login/components/campo_login.dart';
import 'package:flutter_akwen/app/modulos/login_store.dart';

import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final store = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('${store.email} - ${store.password}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CampLogin(hintText: 'mail@mail.com', labelText: 'Usuario', type: 'email', ),
            SizedBox(height: screen.height * 0.03,),
            const CampLogin(hintText: '***********', labelText: 'Senha', type: 'password',),
            SizedBox(height: screen.height * 0.04,),
            const ButtonLogin()
          ],
        ),
      ),
    );
  }
}