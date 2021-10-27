import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/login/components/buttons/button_login.dart';
import 'package:flutter_akwen/app/modulos/login/components/campo_login.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = Modular.get<LoginStore>();
  String uid = '';

  Future teste() async{
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      if(user == null){
        uid = 'vazio';
      }else{
        uid = user.uid;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(uid),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CampLogin(hintText: 'mail@mail.com',labelText: 'Usuario', type: 'email',),
            SizedBox(height: screen.height * 0.03,),
            const CampLogin(hintText: '***********', labelText: 'Senha', type: 'password',),
            SizedBox(height: screen.height * 0.04,),
            const ButtonLogin(name: 'Login', route: '/home'),
            const ButtonLogin(name: 'Registrar', route: '/registration'),
            ElevatedButton(onPressed: () => teste(), child: Text('testar')),
          ],
        ),
      ),
    );
  }
}


/* Observer(builder: (_) {
return const CampLogin(
  hintText: 'mail@mail.com',
  labelText: 'Usuario',
  type: 'email',
);
}),
SizedBox(
height: screen.height * 0.03,
),
Observer(builder: (_) {
return const CampLogin(
  hintText: '***********',
  labelText: 'Senha',
  type: 'password',
);
}),
SizedBox(
height: screen.height * 0.04,
),
Observer(builder: (_) {
return const ButtonLogin(name: 'Login', route: '/home');
}),
Observer(builder: (_) {
return const ButtonLogin(
    name: 'Registrar', route: '/registrartion');
}), */