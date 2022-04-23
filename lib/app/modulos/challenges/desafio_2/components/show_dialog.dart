import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

Future ShowDialogRightDesafio02(
  BuildContext context, 
  Function() _color, 
  Function(bool iscolor) _textStyle, 
  Desafio2Store store, 
  GroupStore storeGroup, 
  Group2Store storeGroup2,
  String challenge
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
                      Text('Resposta certa', style: _textStyle(false),),
                      const SizedBox(width: 20,),
                      const Icon(Icons.check, size: 50, color: Colors.green,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('+ 10', style: _textStyle(true),),
                      const SizedBox(width: 10),
                      Icon(TablerIcons.fish, color: _color(), size: 40,),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(screen.width * 0.8, 50),
                      primary: _color(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      shadowColor: Colors.black
                    ),
                    onPressed: () {
                      if(challenge == 'desafio1'){
                        Navigator.of(context).pop();
                        storeGroup.setNumDesfio(1);
                        storeGroup.setPTS(10);
                      }else if(challenge == 'desafio2') {
                        Navigator.of(context).pop();
                        storeGroup2.setNumDesfio(1);
                        storeGroup2.setPTS(10);
                      }
                    } , child: Text('Proximo', style: _textStyle(false)))

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


  Future ShowDialogErrorDesafio02(
     BuildContext context, 
    Function() _color, 
    Function(bool iscolor) _textStyle, 
    Desafio2Store store, 
    GroupStore storeGroup, 
    Group2Store storeGroup2,
    String challenge
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
                      Text('Resposta errada', style: _textStyle(false),),
                      const SizedBox(width: 20,),
                      const Icon(Icons.close, size: 50, color: Colors.red,),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(screen.width * 0.8, 50),
                      primary: _color(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      shadowColor: Colors.black
                    ),
                    onPressed: () {
                      if(challenge == 'desafio1'){
                        Navigator.of(context).pop();
                        storeGroup.setNumDesfio(1);
                      }else if(challenge == 'desafio2') {
                        Navigator.of(context).pop();
                        storeGroup2.setNumDesfio(1);
                      }
                    } , child: Text('Proximo', style: _textStyle(false)))

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