import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
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

  bool _showPassword = true;
  bool _isLogging = false;

  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    disposers = [
      reaction((_) => store.logged == true,
               (_) => Modular.to.navigate(HomeModule.routeName)),
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
              ).show(context)),
      reaction(
        (_) => store.incorretLogin == false,
        (_) => store.errorLogin()
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
              ).show(context)),
      reaction(
        (_) => store.errorMessage.isNotEmpty || store.incorretLogin == false, 
        (_) => setState(() {
          _isLogging = false;
        })
      )
    ];
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    for (var element in disposers) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ColumnSpace(),
            const Text('Email/Username', style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              width: screen.width * 0.8,
              child: TextFormField(
                controller: store.emailController,
                decoration: const InputDecoration(
                  hintText: 'Email ou Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            _ColumnSpace(),
            const Text('Senha', style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              width: screen.width * 0.8,
              child: TextFormField(
                controller: store.passwordController,
                decoration: InputDecoration(
                    hintText: 'Senha',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        })),
                obscureText: _showPassword,
              ),
            ),
            _ColumnSpace(),
            Observer(builder: (_) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screen.width * 0.8, 50)
                ),
                onPressed: () {
                  store.login();
                  if(!store.logged){
                    setState(() {
                      _isLogging = true;
                    });
                  }
                }, 
                child: _isLogging 
                  ? const CircularProgressIndicator( color: Colors.white, ) 
                  : const Text('Login') 
              );
            }),

            _ColumnSpace(),
            Observer(builder: (_) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screen.width * 0.8, 50)
                ),
                onPressed: () => Modular.to.navigate('/registration'), 
                child: const Text('Cadastrar')
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _ColumnSpace() {
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      height: screen.height * 0.04,
    );
  }
}
