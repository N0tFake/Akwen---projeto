import 'package:flutter_akwen/app/modulos/challenges/group/pages/task_01.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/pages/task_02.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/pages/task_03.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/pages/task_04.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  final String title;
  const GroupPage({Key? key, this.title = 'GroupPage'}) : super(key: key);
  @override
  GroupPageState createState() => GroupPageState();
}

class GroupPageState extends State<GroupPage> {
  final GroupStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch(store.numDesafio){
        case 1:
          return const Group01Task01();
        case 2:
          return const Group01Task02();
        case 3:
          return const Group01Task03();
        case 4:
          return const Group01Task04();
        default: 
          return const ResultadoPage();
      }
    },
    );
  }
}
