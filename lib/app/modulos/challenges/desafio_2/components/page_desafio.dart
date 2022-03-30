import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/components/grid_images.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageDesafio02 extends StatefulWidget {
  final String challenge;
  const PageDesafio02({Key? key, required this.data, required this.challenge }) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _PageDesafio02State createState() => _PageDesafio02State();
}

class _PageDesafio02State extends State<PageDesafio02> {
  final Desafio2Store store = Modular.get();
  final GroupStore storeGroup = Modular.get();
  final Group2Store storeGroup2 = Modular.get();

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
                  if(widget.challenge == 'desafio1'){
                    Navigator.of(context).pop();
                    storeGroup.setNumDesfio(1);
                    storeGroup.setPTS(10);
                  }else if(widget.challenge == 'desafio2') {
                    print('dentro do desafio');
                    Navigator.of(context).pop();
                    storeGroup2.setNumDesfio(1);
                    storeGroup2.setPTS(10);
                  }
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
                  if(widget.challenge == 'desafio1'){
                    storeGroup.setNumDesfio(1);
                  }else if(widget.challenge == 'desafio2'){
                    storeGroup2.setNumDesfio(1);
                  }
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
    String titleQuestion = 'Error';
    if(widget.challenge == 'desafio1'){
      titleQuestion = 'Selecione/Escolha a figura do(a) ${widget.data['ptbr'][corrent]}';
    }else if(widget.challenge == 'desafio2'){
      titleQuestion = 'Watinã/Smisutu ${widget.data['akwe'][corrent]} hêmba';
    }
    return Observer(builder: (_) {
      store.setNumPosition(corrent);
      return Scaffold(
        appBar: AppBar(
          title: Text(titleQuestion),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Modular.to.navigate('/home'),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            GridImages(corrent: corrent,),
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
