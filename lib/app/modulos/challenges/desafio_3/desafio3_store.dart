import 'package:mobx/mobx.dart';

part 'desafio3_store.g.dart';

class Desafio3Store = _Desafio3StoreBase with _$Desafio3Store;
abstract class _Desafio3StoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}