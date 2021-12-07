import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/opc_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/components/grid_images.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageDesafio02 extends StatefulWidget {
  const PageDesafio02({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _PageDesafio02State createState() => _PageDesafio02State();
}

class _PageDesafio02State extends State<PageDesafio02> {
  final Desafio2Store store = Modular.get();
  final GroupStore storeGroup = Modular.get();

  void confirm() {
    if (store.isCorrent) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Resposta certa +10pts'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  storeGroup.setNumDesfio(1);
                  storeGroup.setPTS(10);
                },
                child: const Text('Proximo'))
          ],
        ));
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Resposta errada'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  storeGroup.setNumDesfio(1);
                },
                child: const Text('Proximo'))
          ],
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    int tamanho = widget.data['akwe'].length;
    int corrent = Random().nextInt(tamanho);
    return Observer(builder: (_) {
      store.setNumPosition(corrent);
      return Scaffold(
        appBar: AppBar(
          title: Text('Selecionde o ${widget.data['akwe'][corrent]}'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Modular.to.navigate('/home'),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            const GridImages(),
            Observer(builder: (_) {
              return ElevatedButton(
                  onPressed: !store.isChosen ? null : confirm,
                  child: const Text('Confirmar'));
            })
          ],
        ));
    });
  }
}
