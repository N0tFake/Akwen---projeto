import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

class RegistrationPage extends StatefulWidget {
  final String title;
  const RegistrationPage({Key? key, this.title = 'RegistrationPage'})
      : super(key: key);
  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  final RegistrationStore store = Modular.get();
  Services service = Modular.get();

  bool _isLogging = false;

  List<ReactionDisposer> disposers = [];

  @override
  void initState(){
    disposers = [
      reaction(
        (_) => store.registered == true, 
        (_) => Modular.to.navigate(HomeModule.routeName)
      ),
      reaction(
        (_) => store.usernameExist == true, 
        (_) => Flushbar(
          title: 'Error',
          message: 'Username já está cadastrado!',
          mainButton: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ).show(context)
      ),
      reaction(
        (_) => store.errorMessage.isNotEmpty, 
        (_) => Flushbar(
          title: 'Error',
          message: store.errorMessage,
          mainButton: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ).show(context)
      ),
      reaction(
        (_) => store.errorMessage.isNotEmpty || store.usernameExist == true, 
        (_) => setState(() {
          _isLogging = false;
        })
      )
    ];
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override 
  void dispose(){
    store.dispose();
    for(var element in disposers){
      element.call();
    }
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Modular.to.navigate('/login'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _columnSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return Checkbox(
                      value: store.isStudent,
                      onChanged: (bool? value) {
                        store.setIsStudent(value);
                      });
                }),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                    'Conta para estudante. \nObs: Contas para estudante não precisam de email.'),
              ],
            ),
            _columnSpace(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return Text(
                    'Email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: store.isStudent ? Colors.grey : null),
                  );
                }),
                Observer(builder: (_) {
                  return SizedBox(
                    width: screen.width * 0.8,
                    child: TextFormField(
                      enabled: !store.isStudent,
                      validator: (email) {
                        if(store.isStudent){
                          return null;
                        } else if(email != null && !EmailValidator.validate(email)){
                          return 'Email invalido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: store.emailController,
                    ),
                  );
                }),
              ],
            ),
            _columnSpace(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Observer(builder: (_) {
                  return SizedBox(
                    width: screen.width * 0.8,
                    child: TextFormField(
                      validator: (username) {
                        if(username == null 
                          || username.isEmpty 
                          || username == ''){
                          return 'Esse campo é obrigatorio';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: store.usernameController,
                    ),
                  );
                }),
              ],
            ),
            _columnSpace(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Senha',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Observer(builder: (_) {
                  return SizedBox(
                    width: screen.width * 0.8,
                    child: TextFormField(
                      validator: (pass) {
                        if(pass == null || pass.isEmpty){
                          return 'Esse campo é obrigatorio';
                        }else if (pass.length < 6){
                          return 'A senha deve ter no minimo 6 caracter';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: '********',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                store.setHintPassword(!store.hintPassword),
                            icon: Icon(store.hintPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      obscureText: store.hintPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: store.passController,
                    ),
                  );
                }),
              ],
            ),
            _columnSpace(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Confirme a senha',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Observer(builder: (_) {
                  return SizedBox(
                    width: screen.width * 0.8,
                    child: TextFormField(
                      validator: (pass) {
                        if(pass == null || pass.isEmpty){
                          return 'Esse campo é obrigatorio';
                        }else if (pass != store.passController.text){
                          return 'As senha não são iguais';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: '********',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () => store.sethintConfirmPassword(
                                  !store.hintConfirmPassword),
                              icon: Icon(store.hintConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                      obscureText: store.hintConfirmPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: store.confirPasslController
                    ),
                  );
                }),
              ],
            ),
            _columnSpace(),
            Observer(builder: (_) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screen.width * 0.8, 50)
                ),
                onPressed: () {
                  setState(() {
                    _isLogging = true;
                  });
                  if(!_formKey.currentState!.validate()){
                    Flushbar(
                      title: 'Error',
                      message: 'Insira os dados corretamentes',
                      duration: const Duration(seconds: 2),
                    ).show(context);
                  } else {
                    if(store.isStudent){
                      String studentEmail = store.usernameController.text + '@student.com';
                      store.emailController.text = studentEmail;
                    }
                    store.register();
                  }
                },
                child: _isLogging 
                  ? const CircularProgressIndicator( color: Colors.white, ) 
                  : const Text('Cadastrar'),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _columnSpace() {
    return const SizedBox(
      height: 20,
    );
  }

  InputDecoration _InputDecoration(String hintText){
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white70,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: greeColor, width: 2.0),
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
    );
  }

   InputDecoration _inputDecorationPassword(bool _showPassword){
    return InputDecoration(
      hintText: '********',
      filled: true,
      fillColor: Colors.white70,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: greeColor, width: 2.0),
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
        color: _showPassword ? Colors.grey : greeColor,
        onPressed: () {
          setState(() {
            _showPassword = !_showPassword;
          });
        })
    );
  }
}
