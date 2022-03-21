import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group2/group2_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  final String title;
  final String challenge;
  const ResultadoPage({Key? key, this.title = 'ResultadoPage', required this.challenge})
      : super(key: key);
  @override
  ResultadoPageState createState() => ResultadoPageState();
}

class ResultadoPageState extends State<ResultadoPage> {
  final ResultadoStore store = Modular.get();
  final GroupStore storeGroup = Modular.get();
  final Group2Store storeGroup2 = Modular.get();

  @override
  Widget build(BuildContext context) {
    final ResultadoStore store = Modular.get();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text(
                  'Você recebeu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (_) {
                      if(widget.challenge == 'desafio1'){
                        return Text(
                          '${storeGroup.pts}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: storeGroup.pts == 0
                              ? Colors.red
                              : Colors.green),
                      );
                      }else if(widget.challenge == 'desafio2'){
                        return Text(
                          '${storeGroup2.pts}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: storeGroup2.pts == 0
                              ? Colors.red
                              : Colors.green),
                        );
                      }
                      return const Text('Error');
                    }),
                    const Text(
                      ' Pontos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )
                    )
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if(widget.challenge == 'desafio1'){
                  storeGroup.reset();
                }else  if(widget.challenge == 'desafio2'){
                  storeGroup2.reset();
                }
                Modular.to.navigate('/home');
              },
              child: const Text('Voltar para a Home'))
          ],
        ),
      ),
    );
  }
}
