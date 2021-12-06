import 'package:mobx/mobx.dart';

part 'desafio2_store.g.dart';

class Desafio2Store = _Desafio2StoreBase with _$Desafio2Store;
abstract class _Desafio2StoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}