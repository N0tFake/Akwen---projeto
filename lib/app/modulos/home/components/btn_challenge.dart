
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonChallenge extends StatelessWidget {
  final int number;
  final String imgUrl;
  final Color color;
  const ButtonChallenge({ 
    Key? key, 
    required this.number, 
    required this.imgUrl, 
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Map colorName = {
      1: redColor,
      2: blueColor,
      3: const Color(0xff277a32)
    };

    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.fill
        )
      ),  

      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white
        ),
        onPressed: () {
          if(number == 1){
            Modular.to.navigate('/group');
          }else if(number == 2){
            Modular.to.navigate('/group2');
          }else if(number == 3){
            Modular.to.navigate('/desafio3');
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                color: number == 1 ? redColor : color,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Text(
                'Desafio $number',
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 70,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
          ],
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