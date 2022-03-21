import 'package:mobx/mobx.dart';

part 'group2_store.g.dart';

class Group2Store = _Group2StoreBase with _$Group2Store;
abstract class _Group2StoreBase with Store {

  @observable
  int numDesafio = 1;
  @action 
  void setNumDesfio(int value) =>  numDesafio += value;

  @observable
  int pts = 0;
  @action 
  void setPTS(int value) => pts += value;

  void reset(){
    numDesafio = 1;
    pts = 0;
  } 
}