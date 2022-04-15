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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(child: Image(image: AssetImage('assets/images/uft.png'),),),
            _ColumnSpace(0.04),
            const Text('Email ou Username', 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 20, 
                fontFamily: 'Nunito')),
            _ColumnSpace(0.02),
            SizedBox(
              width: screen.width * 0.8,
              child: TextFormField(
                controller: store.emailController,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  hintText: 'Email ou Username',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.all(
                        Radius.circular(25.0), 
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(
                        Radius.circular(25.0), 
                    ),
                  ),
                ),
              ),
            ),
            _ColumnSpace(0.04),
            const Text('Senha', style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20, 
              fontFamily: 'Nunito'),
            ),
            _ColumnSpace(0.02),
            SizedBox(
              width: screen.width * 0.8,
              child: TextFormField(
                controller: store.passwordController,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    hintText: 'Senha',
                    focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.all(
                        Radius.circular(25.0), 
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(
                        Radius.circular(25.0), 
                    ),
                  ),
                    suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        hoverColor: Colors.transparent,
                        color: _showPassword ? Colors.grey : Colors.green,
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        })),
                obscureText: _showPassword,
              ),
            ),
            _ColumnSpace(0.04),
            Observer(builder: (_) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screen.width * 0.8, 50),
                  primary: const Color(0xffFF2400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  )
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
                  : const Text('Login', style: TextStyle(
                    fontSize: 20
                  ),) 
              );
            }),

            _ColumnSpace(0.04),
            Observer(builder: (_) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screen.width * 0.8, 50),
                  primary: const Color(0xff007FFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  )
                ),
                onPressed: () => Modular.to.navigate('/registration'), 
                child: const Text('Cadastrar', style: TextStyle(fontSize: 20),)
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _ColumnSpace(double floating) {
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      height: screen.height * floating,
    );
  }
}
