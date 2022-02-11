import 'package:mobx/mobx.dart';

part 'desafio2_store.g.dart';

class Desafio2Store = _Desafio2StoreBase with _$Desafio2Store;
abstract class _Desafio2StoreBase with Store {

  @observable
  int posCorrent = 0;

  @action
  void setPosCorrent(int value) => posCorrent = value;

  @observable
  int numPosition = 0; // Posição da imagem certa

  @action
  void setNumPosition(int value) => numPosition = value;


  @observable
  bool isCorrent = false;

  @action 
  void setIsCorrent(bool value) => isCorrent = value;

  @observable
  bool isChosen = false;

  @action 
  void setChosen(bool value) => isChosen = value;

}