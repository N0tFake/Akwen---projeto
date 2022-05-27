import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecondLodingScreenPage extends StatefulWidget {
  const SecondLodingScreenPage({ Key? key }) : super(key: key);

  @override
  State<SecondLodingScreenPage> createState() => _SecondLodingScreenPageState();
}

class _SecondLodingScreenPageState extends State<SecondLodingScreenPage> {

  Future<void> loding() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Modular.to.navigate(LoginModule.routeName);
    });
  }

  @override
  void initState(){
    super.initState();
    loding();
  }


  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: ImgBackground(
        height: false,
        child: Container(
          padding: const EdgeInsets.only(top: 45),
          color: Colors.white24,
          child: Column(
            children: [
              const Text('Parceiros',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: redColor
                ),
              ),
              _sizedBoxImage('assets/images/profnit.png'),
              _sizedBoxImage('assets/images/funai.png'),
              _sizedBoxImage('assets/images/uft.png'),
              _sizedBoxImage('assets/images/kri-rowahtuze.png'),
            
              Container(
                padding: const EdgeInsets.all(10),
                width: screen.width, 
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white60,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 25,
                      offset: Offset(0, 10)
                    )
                  ]
                ),
                child: const Text(
                  'ESTE PRODUTO FOI DESENVOLVIDO PELO MESTRANDO ' 
                  'ARTHUR PRUDENTE JUNQUEIRA EM PARCERIA COM A ' 
                  'COMUNIDADE RIOZINHO KAKUMHU COMO '
                  'PRODUTO FINAL DE DISSERTAÇÃO DO MESTRADO DO PROGRAMA de '
                  'Pós-Graduação em Propriedade Intelectual e '
                  'Transferência de Tecnologia para a Inovação - PROFNIT', 
                  style: TextStyle(
                    fontFamily: 'Nunito'
                  ),
                ),
              )
            ],
          ),
       ),
      ), 
    );
  }

  Widget _sizedBoxImage(String url){
    return Expanded(
      child: SizedBox(
        /* decoration: const BoxDecoration(
          color: Colors.white24,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 25,
              offset: Offset(0, 5)
            )
          ]
        ), */
        width: 80,
        height: 80,
        child: Image(image: AssetImage(url))
      ),
    );
  }

}