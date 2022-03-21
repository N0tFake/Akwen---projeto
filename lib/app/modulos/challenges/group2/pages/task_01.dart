import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_page.dart';

class Group02Task01 extends StatefulWidget {
  const Group02Task01({ Key? key }) : super(key: key);

  @override
  _Group02Task01State createState() => _Group02Task01State();
}

class _Group02Task01State extends State<Group02Task01> {
  @override
  Widget build(BuildContext context) {
    return const Desafio1Page(challenge: 'desafio2',);
  }
}