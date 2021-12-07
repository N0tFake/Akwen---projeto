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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Dasihâze dakrãiwaihkuzê',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            _sizedBoxImage('assets/images/UFT.png'),
            _sizedBoxImage('assets/images/profnit.png'),
            _sizedBoxImage('assets/images/funai.png'),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _sizedBoxImage(String url){
    return SizedBox(
      width: 100,
      height: 100,
      child: Image(image: AssetImage(url))
    );
  }
}