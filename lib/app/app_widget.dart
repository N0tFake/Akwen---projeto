import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dasihâze dakrãiwaihkuzê - O jogo',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
