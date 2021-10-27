import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Desafio2Page extends StatefulWidget {
  final String title;
  const Desafio2Page({Key? key, this.title = 'Desafio2Page'}) : super(key: key);
  @override
  Desafio2PageState createState() => Desafio2PageState();
}
class Desafio2PageState extends State<Desafio2Page> {
  final Desafio2Store store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () => Modular.to.navigate('/home'),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('desafio 2')
        ],
      ),
    );
  }
}