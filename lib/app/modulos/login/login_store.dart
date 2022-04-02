import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/login/login_repository.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  
  final LoginRepository _loginRepository;

  _LoginStoreBase(this._loginRepository);


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable 
  bool isLogin = false;
  @action 
  void setIsLogin(bool value) => isLogin = value;

  @observable 
  bool logged = false;

  @observable 
  bool incorretLogin = true;

  @observable 
  String errorMessage = '';

  @action 
  Future<void> login() async {
    try {
      if(await _loginRepository.login(
          emailController.text, 
          passwordController.text
        ) == true ) {
        
        logged = true;  
      
      }
      
    } catch(e) {
      if(e.toString() == 'E-mail ou senha incorretos'){
        incorretLogin = false;
      } else {
        errorMessage = e.toString();
      }
    }
  }

  @action 
  void errorLogin(){
    logged = false;
    incorretLogin = true;
    errorMessage = '';
  }

  @action 
  void dispose(){
    logged = false;
    incorretLogin = true;
    errorMessage = '';
    emailController.clear();
    passwordController.clear();
  }

}