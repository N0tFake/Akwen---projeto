import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/btn_confirm.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/future_get_url_img.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/opc_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Desafio1Page extends StatefulWidget {
  final String title;
  const Desafio1Page({Key? key, this.title = 'Desafio1Page'}) : super(key: key);
  @override
  Desafio1PageState createState() => Desafio1PageState();
}

class Desafio1PageState extends State<Desafio1Page> {
  final Desafio1Store store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio 01'),
        leading: IconButton(
          onPressed: () => Modular.to.navigate('/home'),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          const Text('Qual o nome do arco e flecha em akwẽ'),
          const GetImg(),
          Observer(builder: (_) {
            return OpcAnswers();
          }),
          Observer(builder: (_) {
            return BtnConfirm();
          })
        ],
      ),
    );
  }
}
