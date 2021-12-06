import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/future_get_url_img.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/opc_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageDesafio extends StatefulWidget {
  const PageDesafio({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _PageDesafioState createState() => _PageDesafioState();
}

class _PageDesafioState extends State<PageDesafio> {
  final Desafio1Store store = Modular.get();
  final GroupStore storeGroup = Modular.get();

  void confirm() {
    if (store.opcEscolhida == widget.data['akwe'][store.numPosition]) {
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Resposta certa +10pts'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                storeGroup.setNumDesfio(1);
                storeGroup.setPTS(10);
              }, 
              child: const Text('Proximo')
            )
          ],
        )
      );
    } else {
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (BuildContext context) => AlertDialog(
          content: const Text('Resposta errada'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                storeGroup.setNumDesfio(1);
              }, 
              child: const Text('Proximo')
            )
          ],
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Qual o nome em Akwe do(a) ${widget.data['ptbr'][store.numPosition]}'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Modular.to.navigate('/home'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          const GetImg(),
          Observer(builder: (_) {
            return const OpcAnswers();
          }),
          SizedBox(height: screen.height * 0.04),
          Observer(builder: (_) {
            return ElevatedButton(
                onPressed: !store.isChosen ? null : confirm,
                child: const Text('Confirmar'));
          })
        ],
      ),
    );
  }
}
