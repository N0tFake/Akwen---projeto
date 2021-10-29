import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/btn_confirm.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/future_get_url_img.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/opc_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class Desafio1Page extends StatefulWidget {
  final String title;
  const Desafio1Page({Key? key, this.title = 'Desafio1Page'}) : super(key: key);
  @override
  Desafio1PageState createState() => Desafio1PageState();
}

class Desafio1PageState extends State<Desafio1Page> {
  final Desafio1Store store = Modular.get();
  final ResultadoStore storeResult = Modular.get();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qual o nome do arco e flecha em akwẽ'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Modular.to.navigate('/home'),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          const GetImg(),
          Observer(builder: (_) {
            return OpcAnswers();
          }),
          SizedBox(height: screen.height * 0.04),
          Observer(builder: (_) {
            return ElevatedButton(
              onPressed: () {
                store.opcEscolhida == 'Wakrowde' 
                  ? storeResult.setResultado('Correta') 
                  : storeResult.setResultado('Errada');
                
                Modular.to.navigate('/resultado');
              },
              child: const Text('Confirmar')
            );
          })
        ],
      ),
    );
  }

  alertDialog(BuildContext context){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: store.opcEscolhida == 'Wakrowde' ? const Text('Acertou !!!') : const Text('Errado'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('sair')
            )
          ],
        );
      }
    );
  }
}
