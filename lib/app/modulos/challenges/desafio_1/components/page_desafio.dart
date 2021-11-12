import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/future_get_url_img.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/opc_answers.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageDesafio extends StatefulWidget {
  const PageDesafio({ Key? key, required this.data }) : super(key: key);
  final Map<String, dynamic> data;

  @override
  _PageDesafioState createState() => _PageDesafioState();
}

class _PageDesafioState extends State<PageDesafio> {

  final Desafio1Store store = Modular.get();
  final GroupStore storeGroup = Modular.get();

  void confirm(){
    if(store.opcEscolhida == widget.data['akwe'][store.numPosition]){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resposta correta'),
        )
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resposta errada'),
        )
      );
    }

    if(storeGroup.visible1 == true){
      storeGroup.setVisible1(false);
      storeGroup.setVisible2(true);
      
      store.setChosen(false);
      store.setOpc('');
      
    } else if(storeGroup.visible2 == true) {
      storeGroup.setVisible2(false);
      storeGroup.setVisible3(true);

      store.setChosen(false);
      store.setOpc('');

    }else {
      store.setChosen(false);
      store.setOpc('');

      storeGroup.setVisible1(true);
      storeGroup.setVisible1(false);
      storeGroup.setVisible1(false);
      Modular.to.navigate('/resultado');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Qual o nome em Akwe do(a) ${widget.data['ptbr'][store.numPosition]}'),
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
              onPressed: !store.isChosen ? null :  confirm,
              child: const Text('Confirmar')
            );
          })
        ],
      ),
    );
  }
}