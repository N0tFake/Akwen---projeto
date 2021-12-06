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
            Modular.to.navigate('/group');
          }else if(name == 'Desafio 2'){
            alert(context);
            //Modular.to.navigate('/desafio2');
          }else if(name == 'Desafio 3'){
            alert(context);
            //Modular.to.navigate('/desafio3');
          }else{
            AlertDialog(
              title: Row(
                children: const [
                  Text('Error'),
                  Icon(Icons.warning)
                ],
              ),
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

  Future alert(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.warning),
              SizedBox(width: 10),
              Text('Error'),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Essa pagina está em desenvolvimento'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sair'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}