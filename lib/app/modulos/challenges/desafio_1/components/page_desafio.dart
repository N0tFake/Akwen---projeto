import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/future_get_url_img.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/opc_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageDesafio extends StatefulWidget {
  final String challenge;
  const PageDesafio({Key? key, required this.data, required this.challenge}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _PageDesafioState createState() => _PageDesafioState();
}

class _PageDesafioState extends State<PageDesafio> {
  final Desafio1Store store = Modular.get();
  final GroupStore storeGroup = Modular.get();
  final Group2Store storeGroup2 = Modular.get();


  void confirm() {
    if(widget.challenge == 'desafio1'){
      if (store.opcEscolhida == widget.data['akwe'][store.numPosition]) {
        _showDialogRight();
      } else {
        _showDialogError();
      }
    }else if(widget.challenge == 'desafio2'){
      if (store.opcEscolhida == widget.data['ptbr'][store.numPosition]) {
        _showDialogRight();
      } else {
        _showDialogError();
      }
    } 
    
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    String titleQuestion = 'Error';
    if(widget.challenge == 'desafio1'){
      titleQuestion = 'Qual o nome em Akwe do(a) ${widget.data['ptbr'][store.numPosition]}';
    }else if(widget.challenge == 'desafio2'){
      titleQuestion = 'Nanēp ${widget.data['akwe'][store.numPosition]} īsisize ktâwankõnã';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(titleQuestion),
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
            return OpcAnswers(challenge: widget.challenge);
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

  Future _showDialogRight(){
    return showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Resposta certa +10pts'),
        actions: [
          TextButton(
            onPressed: (){
              if(widget.challenge == 'desafio1'){
                Navigator.of(context).pop();
                storeGroup.setNumDesfio(1);
                storeGroup.setPTS(10);
              }else if(widget.challenge == 'desafio2') {
                Navigator.of(context).pop();
                storeGroup2.setNumDesfio(1);
                storeGroup2.setPTS(10);
              }
            }, 
            child: const Text('Proximo')
          )
        ],
      )
    );
  }

  Future _showDialogError(){
    return showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Resposta errada'),
        actions: [
          TextButton(
            onPressed: (){
              if(widget.challenge == 'desafio1'){
                Navigator.of(context).pop();
                storeGroup.setNumDesfio(1);
              }else if(widget.challenge == 'desafio2') {
                Navigator.of(context).pop();
                storeGroup2.setNumDesfio(1);
              }
              
            }, 
            child: const Text('Proximo',)
          )
        ],
      )
    );
  }

}
