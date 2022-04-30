import 'package:flutter_akwen/app/modulos/challenges/desafio_3/components/challenge/selection_task.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/components/tasks.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class Desafio3Page extends StatefulWidget {
  final String title;
  const Desafio3Page({Key? key, this.title = 'Desafio3Page'}) : super(key: key);
  @override
  Desafio3PageState createState() => Desafio3PageState();
}

class Desafio3PageState extends State<Desafio3Page> {
  final Desafio3Store store = Modular.get();

  List<ReactionDisposer> disposers = [];

  @override
  void initState() {
    store.getDoc();
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        switch (store.numberTask) {
          case 1:
            return Tasks(
                phraseQuestion: store.phrasePTBR1,
                phraseCorrect: store.phraseAkwe1,
                isAkwe: false);
          case 2:
            return Tasks(
                phraseQuestion: store.phraseAkwe1,
                phraseCorrect: store.phrasePTBR1,
                isAkwe: true);
          case 3:
            return Tasks(
                phraseQuestion: store.phrasePTBR2,
                phraseCorrect: store.phraseAkwe2,
                isAkwe: false);
          case 4:
            return Tasks(
                phraseQuestion: store.phraseAkwe2,
                phraseCorrect: store.phrasePTBR2,
                isAkwe: true);
          case 5:
            return SelectionTasks(
              phraseQuestion: store.phraseAkwe3,
              phraseCorrect: store.phrasePTBR3,
            );
          case 6:
            return Observer(builder: (_) {
              return SelectionTasks(
                  phraseQuestion: store.phraseAkwe4,
                  phraseCorrect: store.phrasePTBR4);
            });
          default:
            return const ResultadoPage(challenge: 'desafio3');
        }
      },
    );
  }
}
