import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/utils/audio.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/components/grid_images.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/components/show_dialog.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

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

  void confirm(BuildContext context) {
    if (store.isCorrent) {
      playaudioChallenge(true);
      ShowDialogRightDesafio02(context, _color, _textStyle, store, storeGroup, storeGroup2, widget.challenge);
    } else {
      playaudioChallenge(false);
      ShowDialogErrorDesafio02(context, _color, _textStyle, store, storeGroup, storeGroup2, widget.challenge);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

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
        body: ImgBackground(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => {
                        storeGroup.reset(),
                        storeGroup2.reset(),
                        Modular.to.navigate(HomeModule.routeName), 
                      },
                      icon: Icon(Icons.arrow_back_ios, color: _color(), size: 40)
                    ),
                    Expanded(
                      child: Text(titleQuestion,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 30,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(TablerIcons.fish, color: _color(), size: 40,),
                      const SizedBox(width: 10,),
                      Text( widget.challenge == 'desafio1' ? '${storeGroup.pts}' : '${storeGroup2.pts}', 
                        style: const TextStyle(
                          fontFamily: 'Nunito', 
                          fontSize: 30,
                          fontWeight: FontWeight.w700
                        ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: GridImages(corrent: corrent, challenge: widget.challenge,)),
                ),
                Observer(builder: (_) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(screen.width * 0.8, 50),
                    primary: _color(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    shadowColor: Colors.black
                  ),
                  onPressed: !store.isChosen ? null : () => confirm(context),
                  child: const Text('Confirmar',
                    style: TextStyle(
                      fontFamily: 'Nunito', 
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    )
                  ));
            })
              ],
            ),
          ),
        ));
    });
  }

  TextStyle _textStyle(bool iscolor){
    return TextStyle(
      fontFamily: 'Nunito', 
      fontSize: 20, 
      fontWeight: FontWeight.bold, 
      color: iscolor == true ? _color() : null);
  }

  Color _color(){
    if(widget.challenge == 'desafio1'){
      return redColor;
    }else if(widget.challenge == 'desafio2'){
      return blueColor;
    }
    return Colors.amber;
  }

}
