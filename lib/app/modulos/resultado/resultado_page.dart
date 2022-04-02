import 'package:flutter_akwen/app/modulos/challenges/desafio_3/desafio3_store.dart';
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
  final Desafio3Store storeGroup3 = Modular.get();

  @override
  Widget build(BuildContext context) {
    final ResultadoStore store = Modular.get();
    int pts = 0;
    if(widget.challenge == 'desafio1'){
      pts = storeGroup.pts;
    }else if(widget.challenge == 'desafio2'){
      pts = storeGroup2.pts;
    }else if(widget.challenge == 'desafio3'){
      pts = storeGroup3.pts;
    }
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
                      return Text(
                          '$pts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: pts == 0
                              ? Colors.red
                              : Colors.green),
                      );
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
                }else if(widget.challenge == 'desafio3'){
                  storeGroup3.reset();
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

/*  if(widget.challenge == 'desafio1'){
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
                      }else if(widget.challenge == 'desafio3'){
                        return Text(
                          '${storeGroup3.pts}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: storeGroup2.pts == 0
                              ? Colors.red
                              : Colors.green),
                        );
                      }
                      return const Text('Error'); */