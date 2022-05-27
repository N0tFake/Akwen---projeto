import 'package:flutter_akwen/app/global/components/img_background.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_akwen/app/modulos/loding_screen/loding_screen_store.dart';
import 'package:flutter/material.dart';

class LodingScreenPage extends StatefulWidget {
  final String title;
  const LodingScreenPage({Key? key, this.title = 'LodingScreenPage'}) : super(key: key);
  @override
  LodingScreenPageState createState() => LodingScreenPageState();
}
class LodingScreenPageState extends State<LodingScreenPage> {
  final LodingScreenStore store = Modular.get();

  Future<void> loding() async {
    await Future.delayed(const Duration(seconds: 4), (){
      Modular.to.navigate('/secondLodingScreen');
    });
  } 

  @override
  void initState() {
    super.initState();
    loding();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: ImgBackground(
        height: false,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(image: AssetImage('assets/images/logo/LOGO-APP.png')),
                  ),
                  Column(
                    children: const [
                      Text('Dasihâze dakrãiwaihkuzê',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: redColor
                    ),
                  ),
                  Text('O Jogo',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 30,
                      fontWeight: FontWeight.w600
                    ),
                  )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}