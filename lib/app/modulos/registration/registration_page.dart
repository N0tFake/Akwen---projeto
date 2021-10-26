import 'package:flutter_akwen/app/modulos/registration/service/registration_service.dart';
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
  RegistrationService service = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: store.setEmail,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'username'),
              onChanged: store.setUsername,
            );
          }),
          Observer(builder: (_) {
            return TextFormField(
              decoration: const InputDecoration(labelText: 'password'),
              onChanged: store.setPassword,
            );
          }),
          Observer(builder: (_) {
            return ElevatedButton(
              onPressed: () => service.cadastrarUser(),
              child: const Text('testar'),
            );
          })
        ],
      ),
    );
  }
}
