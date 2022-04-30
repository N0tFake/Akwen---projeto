import 'package:mobx/mobx.dart';
part 'model_answer.g.dart';

class ModelAnswer = _ModelAnswerBase with _$ModelAnswer;

abstract class _ModelAnswerBase with Store {

  _ModelAnswerBase(this.title);

  @observable 
  String title;

  @action 
  void setTitle(String value) => title = value;
}
