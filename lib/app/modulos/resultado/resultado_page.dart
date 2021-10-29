import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/resultado/resultado_store.dart';
import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  final String title;
  const ResultadoPage({Key? key, this.title = 'ResultadoPage'}) : super(key: key);
  @override
  ResultadoPageState createState() => ResultadoPageState();
}
class ResultadoPageState extends State<ResultadoPage> {
  final ResultadoStore store = Modular.get();

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
            const Text('Sua resposta esta: '),
            Text(
              store.resultado,
              style: TextStyle(
                fontSize: 30,
                color: store.resultado == 'Correta' ? Colors.green : Colors.red,
              ),
            ),
            ElevatedButton(onPressed: () => Modular.to.navigate('/home'), child: const Text('Voltar para a Home'))
          ],
        ),
      ),
    );
  }
}