import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonChallenge extends StatelessWidget {
  final String name;
  final Color color;
  const ButtonChallenge({ Key? key, required this.name, required this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      color: color,  
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white
        ),
        onPressed: () {
          if(name == 'Desafio 1'){
            Modular.to.navigate('/desafio1');
          }else if(name == 'Desafio 2'){
            Modular.to.navigate('/desafio2');
          }else if(name == 'Desafio 3'){
            Modular.to.navigate('/desafio3');
          }else{
            AlertDialog(
              title: const Text('Error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  child: const Text('Sair')
                )
              ],
            );
          }
        }, 
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 50,
          ),
        )
      ),
    );
  }
}