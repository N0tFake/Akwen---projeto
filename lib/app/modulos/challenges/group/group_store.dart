import 'package:mobx/mobx.dart';

part 'group_store.g.dart';

class GroupStore = _GroupStoreBase with _$GroupStore;
abstract class _GroupStoreBase with Store {

  @observable
  bool visible1 = true;
  @observable
  bool visible2 = false;
  @observable
  bool visible3 = false;

  @action 
  void setVisible1(bool value) => visible1 = value;
   @action 
  void setVisible2(bool value) => visible2 = value;
   @action 
  void setVisible3(bool value) => visible3 = value;
}