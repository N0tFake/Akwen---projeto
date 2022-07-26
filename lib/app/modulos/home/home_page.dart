import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/home/components/btn_challenge.dart';
import 'package:flutter_akwen/app/modulos/home/components/data_user_future.dart';
import 'package:flutter_akwen/app/modulos/home/home_store.dart';
import 'package:flutter_akwen/app/modulos/login/login_module.dart';
import 'package:flutter_akwen/app/modulos/login/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final LoginStore loginStore = Modular.get();
  final Services service = Modular.get();

  final user = FirebaseAuth.instance.currentUser;

  List<ReactionDisposer> disposers = [];

  Future<void> delete() async{
    await service.deleteAccount(user?.uid);
  }

  @override
  void initState() {
    disposers = [
      reaction(
        (_) => store.delete == true,
        (_) =>  showDialog(
          context: context, 
          builder: (BuildContext context) => AlertDialog(
            title: const Center(
              child: Text('Conta deletada', 
                style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 20)
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: blueColor,
                  fixedSize: const Size(140, 40)
                ),
                onPressed: (){
                  delete();
                  user?.delete();
                  Modular.to.navigate(LoginModule.routeName);
                }, 
                child: const Text('OK', 
                  style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 20)
                )
              )
            ],
        )),
      )
    ];
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  void dispose() {
    for(var element in disposers){
      element.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FutureDataUsername(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {loginStore.dispose(), service.deslogar()},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Observer(builder: (_) {
            return IconButton(
              onPressed: () => showDialog(
                context: context,
                barrierDismissible: false,              
                builder: (BuildContext context) => AlertDialog(
                  title: const Center(child: Text('Deletar conta')),
                  content: const Text('Você deseja deletar sua conta?'),
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'cancelar',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey),
                      )),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        store.setDelete();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(125, 40),
                        primary: const Color(0xffFF4242),
                      ),
                      child: const Text('Deletar',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
                  ],
                )),
              icon: const Icon(Icons.settings));
          })
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: const [
          Expanded(
              child: ButtonChallenge(
                  number: 1,
                  imgUrl: 'assets/images/fundos/fundo-red.png',
                  color: Colors.red)),
          Expanded(
              child: ButtonChallenge(
                  number: 2,
                  imgUrl: 'assets/images/fundos/fundo-blue-dark.png',
                  color: Colors.blue)),
          Expanded(
              child: ButtonChallenge(
                  number: 3,
                  imgUrl: 'assets/images/fundos/fundo-green.png',
                  color: Colors.green)),
        ],
      ),
    );
  }
}
