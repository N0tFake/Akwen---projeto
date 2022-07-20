import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
abstract class _HomeStoreBase with Store {

  final Services service = Modular.get();

  @observable
  String uid = '';

  @observable
  String username = '';

  @observable 
  bool delete = false;
  @action 
  void setDelete() => delete = true;

  @action 
  void dispose(){
    uid = '';
    username = '';
    delete = false;
  }

}