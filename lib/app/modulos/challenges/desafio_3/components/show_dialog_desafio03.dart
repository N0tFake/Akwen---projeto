import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

Future ShowDialogRightDesafio03(
  BuildContext context, 
  Function textStyle, 
  Desafio3Store store,
  bool isRight,
  ){
    final Size screen = MediaQuery.of(context).size;
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft:  Radius.circular(30)
            ),
            child: SizedBox(
              width: screen.width,
              height: screen.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isRight ?'Resposta certa' : 'Resposta errada', 
                        style: textStyle(),
                      ),
                      const SizedBox(width: 20,),
                      Icon(isRight ? Icons.check : Icons.close, size: 50, color: isRight ? Colors.green : Colors.red,),
                    ],
                  ),

                  isRight ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('+ 10', style: textStyle(),),
                      const SizedBox(width: 10),
                      const Icon(TablerIcons.fish, color: greenColor, size: 40,),
                    ],
                  )
                  : Container(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(screen.width * 0.8, 50),
                      primary: greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      shadowColor: Colors.black
                    ),
                    onPressed: () {
                      if(isRight == true){
                        store.setPTS(10);
                      }
                      store.setNumberTask(1);
                      store.answerReset();
                      Navigator.of(context).pop();
                    }, 
                    child: Text('Proximo', style: textStyle())
                  )

                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    ); 
  }