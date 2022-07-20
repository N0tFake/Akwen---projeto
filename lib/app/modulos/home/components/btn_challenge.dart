import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/global/utils/translation/translation_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonChallenge extends StatefulWidget {
  final int number;
  final String imgUrl;
  final Color color;
  const ButtonChallenge(
      {Key? key,
      required this.number,
      required this.imgUrl,
      required this.color})
      : super(key: key);

  @override
  State<ButtonChallenge> createState() => _ButtonChallengeState();
}

class _ButtonChallengeState extends State<ButtonChallenge> {
  @override
  Widget build(BuildContext context) {
    final Map colorName = {
      1: redColor,
      2: blueColor,
      3: const Color(0xff277a32)
    };

    final TranslationStore translationStore = Modular.get();

    String challengeTranslated() {
      if (translationStore.translation == 'PT-BR') {
        return translationStore.challengePTBR;
      } else {
        return translationStore.challengeAkwe;
      }
    } translationStore.translation == 'PT-BR'? 70 : 44;

    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      decoration: BoxDecoration(
          color: widget.color,
          image: DecorationImage(
              image: AssetImage(widget.imgUrl), fit: BoxFit.fill)),
      child: TextButton(
          style: TextButton.styleFrom(primary: Colors.white),
          onPressed: () {
            if (widget.number == 1) {
              GroupStore store = Modular.get();
              store.playAudioBackground();
              Modular.to.navigate('/group');
            } else if (widget.number == 2) {
              Group2Store store = Modular.get();
              store.playAudioBackground();
              Modular.to.navigate('/group2');
            } else if (widget.number == 3) {
              Desafio3Store store = Modular.get();
              store.playAudioBackground();
              Modular.to.navigate('/desafio3');
            } else {
              AlertDialog(
                title: Row(
                  children: const [Text('Error'), Icon(Icons.warning)],
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Sair'))
                ],
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            decoration: BoxDecoration(
                color: widget.number == 1 ? redColor : widget.color,
                borderRadius: BorderRadius.circular(50)),
            child: Observer(builder: (_) {
              return Expanded(
                child: Text(
                  challengeTranslated() + ' ${widget.number}',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: translationStore.translation == 'PT-BR'? 70 : 44,
                      fontWeight: FontWeight.w800),
                ),
              );
            }),
          )),
    );
  }

  Future alert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.warning),
              SizedBox(width: 10),
              Text('Error'),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Essa pagina está em desenvolvimento'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sair'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
