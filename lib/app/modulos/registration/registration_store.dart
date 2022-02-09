import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStoreBase with _$RegistrationStore;
abstract class _RegistrationStoreBase with Store {

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  void setPassword(String value) => password = value;

  @observable
  String username = '';
  @action
  void setUsername(String value) => username = value;

  @observable 
  bool isStudent = false;
  @action 
  void setIsStudent(value) => isStudent = value;

  @observable 
  bool hintPassword = true;
  @action 
  void setHintPassword(value) => hintPassword = value;

  @observable 
  bool hintConfirmPassword = true;
  @action 
  void sethintConfirmPassword(value) => hintConfirmPassword = value;

}