import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_akwen/app/modulos/login/components/buttons/button_login.dart';
import 'package:flutter_akwen/app/modulos/login/components/campo_login.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:another_flushbar/flushbar.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  String uid = '';

  Future teste() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user == null) {
        uid = 'vazio';
      } else {
        uid = user.uid;
      }
    });
  }

  Future deslogarLogin() async {
    await FirebaseAuth.instance.signOut();
  }

  bool _showPassword = true;

  List<ReactionDisposer> disposers = [];

  @override 
  void initState() {
    disposers = [
      reaction(
        (_) => store.logged == true, 
        (_) => Modular.to.navigate(HomeModule.routeName)
      ),
      reaction(
        (_) => store.incorretLogin == false, 
        (_) => Flushbar(
          title: 'Error',
          icon: const Icon(Icons.sentiment_dissatisfied),
          message: 'Dados de login estão incorretos',
          mainButton: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ).show(context)
      ),
      reaction(
        (_) => store.errorMessage.isNotEmpty, 
        (_) => Flushbar(
          title: 'Erro!',
          message: store.errorMessage,
          mainButton: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ).show(context)
      )
    ];
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override 
  void dispose() {
    store.dispose();
    for(var element in disposers){
      element.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screen.width * 0.8,
              child: TextFormField(
                controller: store.emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: screen.height * 0.04,
            ),
            SizedBox(
              width: screen.width * 0.8,
              child: TextFormField(
                controller: store.passwordController,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off
                    ),
                    hoverColor: Colors.transparent,
                    onPressed: (){
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    }
                  )
                ),
                obscureText: _showPassword,
              ),
            ),
            SizedBox(
              height: screen.height * 0.04,
            ),
            Observer(builder: (_) {
              return const ButtonLogin(name: 'Login', route: '/home');
            }),
            SizedBox(
              height: screen.height * 0.04,
            ),
            const ButtonLogin(name: 'Registrar', route: '/registration'),
            SizedBox(
              height: screen.height * 0.04,
            ),
           /*  ElevatedButton(onPressed: () => teste(), child: Text('testar')),
            SizedBox(
              height: screen.height * 0.04,
            ),
            ElevatedButton(
                onPressed: () => deslogarLogin(), child: Text('deslogar')), */
          ],
        ),
      ),
    );
  }
}