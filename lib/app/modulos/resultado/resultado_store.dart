import 'package:mobx/mobx.dart';

part 'resultado_store.g.dart';

class ResultadoStore = _ResultadoStoreBase with _$ResultadoStore;
abstract class _ResultadoStoreBase with Store {

  @observable
  String resultado = '';

  @action 
  void setResultado(String value) => resultado = value;
}