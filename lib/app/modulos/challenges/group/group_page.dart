import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_page.dart';
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
    return Stack(
      children: [
        Observer(builder: (_) {
          return Visibility(
            visible: store.visible1,
            child: Desafio1Page()
          );
        }),

        Observer(builder: (_) {
          return Visibility(
            visible: store.visible2,
            child: Desafio1Page()
          );
        }),

        Observer(builder: (_) {
          return Visibility(
            visible: store.visible3,
            child: Desafio1Page()
          );
        }),
      ],
    );
  }
}
