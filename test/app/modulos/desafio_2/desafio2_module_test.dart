import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_akwen/app/modulos/desafio_2/desafio2_module.dart';
 
void main() {

  setUpAll(() {
    initModule(Desafio2Module());
  });
}