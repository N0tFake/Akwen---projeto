import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/components/enum_opc.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BtnConfirm extends StatefulWidget {
  const BtnConfirm({ Key? key }) : super(key: key);

  @override
  _BtnConfirmState createState() => _BtnConfirmState();
}

class _BtnConfirmState extends State<BtnConfirm> {
  @override
  Widget build(BuildContext context) {
    Desafio1Store store = Modular.get();
    return ElevatedButton(
      onPressed: () => store.opcEscolhida != '' ? print(store.opcEscolhida) : null, 
      child: const Text('Confirmar')
    );
  }
}