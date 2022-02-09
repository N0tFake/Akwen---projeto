import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';
import 'package:flutter/material.dart';

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
      body: Column(
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
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: store.setEmail,
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
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: store.setEmail,
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
                    onChanged: store.setEmail,
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
                    onChanged: store.setEmail,
                  ),
                );
              }),
            ],
          ),
          _columnSpace(),
          Observer(builder: (_) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(screen.width * 0.8, 50)),
              onPressed: () => service.cadastrarUser(
                  store.email, store.username, store.password),
              child: const Text('Cadastrar'),
            );
          }),
        ],
      ),
    );
  }

  Widget _columnSpace() {
    return const SizedBox(
      height: 20,
    );
  }
}
