import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/app_module.dart';
import 'package:flutter_akwen/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Expanded(
            child: Container(
              color: Colors.red,
              child: const Text('Error'),
            ),
          );
        }

        if(snapshot.connectionState == ConnectionState.done){
          return ModularApp(module: AppModule(), child: const AppWidget());
        }

        return const CircularProgressIndicator(
          color: Colors.green,
        );
      },
    );
  }
}
