import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_page.dart';

class Group01Task01 extends StatefulWidget {
  const Group01Task01({ Key? key }) : super(key: key);

  @override
  _Group01Task01State createState() => _Group01Task01State();
}

class _Group01Task01State extends State<Group01Task01> {
  @override
  Widget build(BuildContext context) {
    return const Desafio1Page(challenge: 'desafio1',);
  }
}