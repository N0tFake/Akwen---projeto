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
    await Future.delayed(const Duration(seconds: 5), (){
      Modular.to.navigate('/login');
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
      body: Container(
        width: screen.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundos/fundo-grey-light.png'),
            fit: BoxFit.cover
          )
        ),
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
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: screen.width, 
              height: 100,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _sizedBoxImageFooterbar('assets/images/uft.png'),
                  _sizedBoxImageFooterbar('assets/images/profnit.png'),
                  _sizedBoxImageFooterbar('assets/images/funai.png'),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sizedBoxImageFooterbar(String url){
    return Expanded(
      child: SizedBox(
        width: 80,
        height: 80,
        child: Image(image: AssetImage(url))
      ),
    );
  }
}

/* 

const Text('Dasihâze dakrãiwaihkuzê O jogo',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
  ),
),
_sizedBoxImage('assets/images/uft.png'),
_sizedBoxImage('assets/images/profnit.png'),
_sizedBoxImage('assets/images/funai.png'),
const SizedBox(height: 20),
const CircularProgressIndicator(),

 */