import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_repository.dart';
import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStoreBase with _$RegistrationStore;
abstract class _RegistrationStoreBase with Store {

  final RegistrationRepository _registerRepository;
  _RegistrationStoreBase(this._registerRepository);

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirPasslController = TextEditingController();

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

  bool isValid(){
    if(EmailValidator.validate(emailController.text) != false){
      return true;
    }
    return false;
  }

  @observable 
  bool usernameExist = false;

  @observable 
  bool registered = false;

  @observable 
  String errorMessage = '';

  @action 
  Future<void> register() async{
    try{
      if( await _registerRepository.register(
        emailController.text, 
        usernameController.text, 
        passController.text,
      ) == false){
        usernameExist = true;
      } else {
        registered = true;
      }
    } catch(e) {
      if(e.toString() == 'Email já cadastrado'){
        errorMessage = e.toString();
      }
    }
  }

  @action 
  void dispose() {
    errorMessage = '';
    emailController.clear();
    passController.clear();
    confirPasslController.clear();
    usernameController.clear();
    usernameExist = false;
    registered = false;
  }

}