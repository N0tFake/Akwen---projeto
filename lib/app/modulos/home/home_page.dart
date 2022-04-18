import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/home/components/btn_challenge.dart';
import 'package:flutter_akwen/app/modulos/home/components/data_user_future.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  final LoginStore store = Modular.get();
  final Services service = Modular.get();

  final uid = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FutureDataUsername(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {
            store.dispose(),
            service.deslogar()
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          Expanded(child: ButtonChallenge(
            number: 1, imgUrl: 'assets/images/fundos/fundo-red.png', color: Colors.red)),
          
          Expanded(child: ButtonChallenge(
            number: 2, imgUrl: 'assets/images/fundos/fundo-blue.png', color: Colors.blue)),
          
          Expanded(child: ButtonChallenge(
            number: 3, imgUrl: 'assets/images/fundos/fundo-green.png', color: Colors.green)),
        ],
      ),
    );
  }
}