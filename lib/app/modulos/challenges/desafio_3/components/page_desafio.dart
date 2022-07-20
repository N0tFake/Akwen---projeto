import 'package:flutter/cupertino.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/components/tasks.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageDesafio03 extends StatefulWidget {
  const PageDesafio03({ Key? key }) : super(key: key);

  @override
  State<PageDesafio03> createState() => _PageDesafio03State();
}

class _PageDesafio03State extends State<PageDesafio03> {

  final Desafio3Store store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (store.numberTask) {
        case 1:
          return Tasks(
            phraseQuestion: store.phraseAkwe1, 
            phraseCorrect: store.phrasePTBR1, 
            isAkwe: true
          );
        default:
          return const Text('Error');
      }
    },
    );
  }
}