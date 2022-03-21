import 'package:flutter_akwen/app/modulos/challenges/group2/pages/task_01.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/pages/task_02.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/pages/task_03.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/pages/task_04.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter/material.dart';

class Group2Page extends StatefulWidget {
  final String title;
  const Group2Page({Key? key, this.title = 'Group2Page'}) : super(key: key);
  @override
  Group2PageState createState() => Group2PageState();
}
class Group2PageState extends State<Group2Page> {
  final Group2Store store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      switch(store.numDesafio) {
        case 1:
          return const Group02Task01();
        case 2:
          return const Group02Task02();
        case 3:
          return const Group02Task03();
        case 4:
          return const Group02Task04();
        default:
          return const ResultadoPage(challenge: 'desafio2',);
      }
    });
  }
}