import 'package:mobx/mobx.dart';
part 'translation_store.g.dart';

class TranslationStore = _TranslationStoreBase with _$TranslationStore;

abstract class _TranslationStoreBase with Store {

  @observable
  String translation = 'PT-BR';
  @action 
  void setTranslation(value){
    if(value == 'AKWẼ'){
      translation = 'akwe';
    } else if( value == 'PT-BR'){
      translation = 'PT-BR';
    }
  } 

  @observable
  String passwordPTBR = 'Senha';
  @observable
  String passwordAkwe = 'Ikmãtteze';
 
  @observable
  String loginPTBR = 'Entrar';
  @observable
  String loginAkwe = 'Aisebre';
 
  @observable
  String resgisterPTBR = 'Cadastrar';
  @observable
  String resgisterAkwe = 'Aisikuikrenã';

  @observable
  String accountStudentNotEmailPTBR = 'Conta para estudante não precisa de e-mail';
  @observable
  String accountStudentNotEmailAkwe = 'Isanãmrkwai sbreze tô tamé tômkã e-mail';

  @observable 
  String accountStudentPTBR = 'Conta para estudante';
  @observable
  String accountStudentAkwe = 'Isanãmrkwai sbreze';
  
  @observable 
  String cadastroPTBR = 'Cadastro';
  @observable
  String cadastroAkwe = 'Dasikuikre ze';

  @observable
  String namePTBR = 'Nome';
  @observable
  String nameAkwe = 'Aisisize';

  @observable
  String confirmPasswordPTBR = 'Confirmar Senha';
  @observable
  String confirmPasswordAkwe = 'Ikmãtteze Watinã';

  @observable 
  String challengePTBR = 'Desafio';
  @observable
  String challengeAkwe = 'Dasikmãstombo ze';

  @observable
  String resultChallengePTBR = 'Resultado do desafio:';
  @observable
  String resultChallengeAkwe = 'Istõmhã dasikmãstombo ze:';

  @observable 
  String nextPTBR = 'Próximo';
  @observable
  String nextAkwe = 'Taparimhã';

  @observable
  String rightAnswerPTBR = 'Resposta Correta';
  @observable
  String rightAnswerAkwe = 'Ikwãiba';
  
  @observable
  String wrongAnswerPTBR = 'Resposta Errada';
  @observable
  String wrongAnswerAkwe = 'Siwakru';
  
  @observable 
  String answerCorrectPTBR = 'Resposta certa';
  @observable
  String answerCorrectAkwe = 'Ikwãiba';

  @observable
  String youReceivedPTBR = 'Você Recebeu';
  @observable
  String youReceivedAkwe = 'Mãt Amwi';

  @observable
  String backToStartPTBR = 'Voltar ao Início';
  @observable
  String backToStartAkwe = 'Aipâ Isnãkrta Hawi';
  
  @observable
  String translatePTBR = 'Traduza a Frase';
  @observable
  String translateAkwe = 'Ikuikre Kmãspikranã';
  
  @observable
  String translateAkewePtbrPTBR = 'Traduza a frase abaixo de akwẽ para português';
  @observable
  String translateAkewePtbrAkwe = 'Ikuikre kmãspikranã akwẽ hawi ktâwankõ tmẽ';
  
  @observable
  String translatePtbrAkwePTBR = 'Traduza a frase abaixo de português para akwẽ';
  @observable
  String translatePtbrAkweAkwe = 'Ikuikre kmãspikranã ktâwankõ hawi akwẽ tmẽ';
  
  @observable
  String confirmPTBR = 'CONFIRMAR';
  @observable
  String confirmAkwe = 'WATINÃ';
}