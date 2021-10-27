import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Desafio3Page extends StatefulWidget {
  final String title;
  const Desafio3Page({Key? key, this.title = 'Desafio3Page'}) : super(key: key);
  @override
  Desafio3PageState createState() => Desafio3PageState();
}
class Desafio3PageState extends State<Desafio3Page> {
  final Desafio3Store store = Modular.get();

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
          Text('desafio 3')
        ],
      ),
    );
  }
}