// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TextForm extends StatelessWidget {
  final String hintText;
  final String type;
  const TextForm({ Key? key, required this.hintText, required this.type }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final store = Modular.get<LoginStore>();

    final Size screen = MediaQuery.of(context).size;
    if(type == 'email'){
      return SizedBox(
        width: screen.width * 0.8,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            //labelText: labelText,
            border: const OutlineInputBorder(),
          ),
          onChanged: store.setEmail,
        ),
      );
    } else if(type == 'password'){
      return SizedBox(
        width: screen.width * 0.8,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            //labelText: labelText,
            border: const OutlineInputBorder(),
          ),
          onChanged: store.setPassword,
        ),
      );
    }

    return const Center(child: Text('Erro'));

  }

}