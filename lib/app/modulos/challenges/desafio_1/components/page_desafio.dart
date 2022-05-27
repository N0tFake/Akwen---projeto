import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/utils/audio.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/global/utils/translation/translation_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/future_get_url_img.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/opc_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/show_dialog.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_akwen/app/modulos/home/home_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PageDesafio extends StatefulWidget {
  final String challenge;
  const PageDesafio({Key? key, required this.data, required this.challenge}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _PageDesafioState createState() => _PageDesafioState();
}

class _PageDesafioState extends State<PageDesafio> {
  final Desafio1Store store = Modular.get();
  final GroupStore storeGroup = Modular.get();
  final Group2Store storeGroup2 = Modular.get();

  void confirm(BuildContext context) {
    if(widget.challenge == 'desafio1'){
      if (store.opcEscolhida == widget.data['akwe'][store.numPosition]) {
        playaudioChallenge(true);
        ShowDialogRight(context, _color, _textStyle, store, storeGroup, storeGroup2, widget.challenge);
      } else {
        playaudioChallenge(false);
        ShowDialogError(context, _color, _textStyle, store, storeGroup, storeGroup2, widget.challenge);
      }
    }else if(widget.challenge == 'desafio2'){
      if (store.opcEscolhida == widget.data['ptbr'][store.numPosition]) {
        playaudioChallenge(true);
        ShowDialogRight(context, _color, _textStyle, store, storeGroup, storeGroup2, widget.challenge);
      } else {
        playaudioChallenge(false);
        ShowDialogError(context, _color, _textStyle, store, storeGroup, storeGroup2, widget.challenge);
      }
    } 
    
  }


  final TranslationStore translationStore = Modular.get();
  String wordTranslated() {
    if (translationStore.translation == 'PT-BR') {
      return translationStore.confirmPTBR;
    } else {
      return translationStore.confirmAkwe;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    String titleQuestion = 'Error';
    if(widget.challenge == 'desafio1'){
      titleQuestion = 'Qual o nome em Akwẽ do(a) ${widget.data['ptbr'][store.numPosition]}';
    }else if(widget.challenge == 'desafio2'){
      titleQuestion = 'Nanēp ${widget.data['akwe'][store.numPosition]} īsisize ktâwankõnã';
    }
    return Scaffold(
      body: ImgBackground(
        height: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => {
                      storeGroup.stopAudioBackground(),
                      storeGroup2.stopAudioBackground(),
                      storeGroup.reset(),
                      storeGroup2.reset(),
                      Modular.to.navigate(HomeModule.routeName)
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
                padding: const EdgeInsets.only(left: 20.0),
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
                child: Column(
                  children: [
                    GetImg(progressColor: _color(),),
                    Observer(builder: (_) {
                      return OpcAnswers(challenge: widget.challenge, progressColor: _color(),);
                    }),
                  ],
                ),
              ),
              SizedBox(height: screen.height * 0.04),

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
                  child: Text(wordTranslated(),
                    style: const TextStyle(
                      fontFamily: 'Nunito', 
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    )
                  ));
            })
            ],
          ),
        ),
      ),
    );
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
