import 'package:mobx/mobx.dart';

part 'desafio1_store.g.dart';

class Desafio1Store = _Desafio1StoreBase with _$Desafio1Store;
abstract class _Desafio1StoreBase with Store {

  @observable
  int numPosition = 0;

  @action
  void setNumPosition(int value) => numPosition = value;

  @observable
  String opcEscolhida = '';

  @action 
  void setOpc(String value) => opcEscolhida = value;

  @observable
  bool isChosen = false;

  @action 
  void setChosen(bool value) => isChosen = value;

}