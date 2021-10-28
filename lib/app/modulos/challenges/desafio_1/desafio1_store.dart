import 'package:mobx/mobx.dart';

part 'desafio1_store.g.dart';

class Desafio1Store = _Desafio1StoreBase with _$Desafio1Store;
abstract class _Desafio1StoreBase with Store {

  @observable
  String opcEscolhida = '';

  @action 
  void setOpc(String value) => opcEscolhida = value;

}