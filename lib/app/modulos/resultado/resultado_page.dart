import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/global/utils/translation/translation_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ResultadoPage extends StatefulWidget {
  final String title;
  final String challenge;
  const ResultadoPage(
      {Key? key, this.title = 'ResultadoPage', required this.challenge})
      : super(key: key);
  @override
  ResultadoPageState createState() => ResultadoPageState();
}

class ResultadoPageState extends State<ResultadoPage> {
  final ResultadoStore store = Modular.get();
  final GroupStore storeGroup = Modular.get();
  final Group2Store storeGroup2 = Modular.get();
  final Desafio3Store storeGroup3 = Modular.get();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final ResultadoStore store = Modular.get();
    int pts = 0;
    if (widget.challenge == 'desafio1') {
      pts = storeGroup.pts;
    } else if (widget.challenge == 'desafio2') {
      pts = storeGroup2.pts;
    } else if (widget.challenge == 'desafio3') {
      pts = storeGroup3.pts;
    }

    final TranslationStore translationStore = Modular.get();
    String wordTranslated(String word) {
      if (translationStore.translation == 'PT-BR') {
        switch (word) {
          case 'resultChallenge':
            return translationStore.resultChallengePTBR;
          case 'received':
            return translationStore.youReceivedPTBR;
          case 'init':
            return translationStore.backToStartPTBR;
        }
      } else {
        switch (word) {
          case 'resultChallenge':
            return translationStore.resultChallengeAkwe;
          case 'received':
            return translationStore.youReceivedAkwe;
          case 'init':
            return translationStore.backToStartAkwe;
        }
      }
      return word;
    }

    return Scaffold(
      body: ImgBackground(
        height: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              wordTranslated('resultChallenge'),
              style: _textStyle(true, 40),
            ),
            Column(
              children: [
                Observer(builder: (_) {
                  return Text(
                    wordTranslated('received'),
                    style: _textStyle(false, 40),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        '$pts',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 60,
                            fontWeight: FontWeight.w800,
                            color: pts == 0 ? Colors.red : Colors.green),
                      );
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      TablerIcons.fish,
                      size: 60,
                      color: _color(),
                    )
                  ],
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(screen.width * 0.8, 50),
                    primary: _color(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    shadowColor: Colors.black),
                onPressed: () {
                  if (widget.challenge == 'desafio1') {
                    storeGroup.stopAudioBackground();
                    storeGroup.reset();
                  } else if (widget.challenge == 'desafio2') {
                    storeGroup2.stopAudioBackground();
                    storeGroup2.reset();
                  } else if (widget.challenge == 'desafio3') {
                    storeGroup3.stopAudioBackground();
                    storeGroup3.reset();
                  }
                  Modular.to.navigate('/home');
                },
                child: Observer(builder: (_) {
                  return Text(
                    wordTranslated('init'),
                    style: _textStyle(false, 20),
                  );
                }))
          ],
        ),
      ),
    );
  }

  TextStyle _textStyle(bool isColor, double fontSize) {
    return TextStyle(
        fontFamily: 'Nunito',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: isColor ? _color() : null);
  }

  Color _color() {
    if (widget.challenge == 'desafio1') {
      return redColor;
    } else if (widget.challenge == 'desafio2') {
      return blueColor;
    } else if (widget.challenge == 'desafio3') {
      return greenColor;
    }
    return Colors.amber;
  }
}
