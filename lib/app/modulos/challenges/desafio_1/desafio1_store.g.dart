// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desafio1_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Desafio1Store on _Desafio1StoreBase, Store {
  final _$numPositionAtom = Atom(name: '_Desafio1StoreBase.numPosition');

  @override
  int get numPosition {
    _$numPositionAtom.reportRead();
    return super.numPosition;
  }

  @override
  set numPosition(int value) {
    _$numPositionAtom.reportWrite(value, super.numPosition, () {
      super.numPosition = value;
    });
  }

  final _$answerCorrentAtom = Atom(name: '_Desafio1StoreBase.answerCorrent');

  @override
  String get answerCorrent {
    _$answerCorrentAtom.reportRead();
    return super.answerCorrent;
  }

  @override
  set answerCorrent(String value) {
    _$answerCorrentAtom.reportWrite(value, super.answerCorrent, () {
      super.answerCorrent = value;
    });
  }

  final _$opcEscolhidaAtom = Atom(name: '_Desafio1StoreBase.opcEscolhida');

  @override
  String get opcEscolhida {
    _$opcEscolhidaAtom.reportRead();
    return super.opcEscolhida;
  }

  @override
  set opcEscolhida(String value) {
    _$opcEscolhidaAtom.reportWrite(value, super.opcEscolhida, () {
      super.opcEscolhida = value;
    });
  }

  final _$isChosenAtom = Atom(name: '_Desafio1StoreBase.isChosen');

  @override
  bool get isChosen {
    _$isChosenAtom.reportRead();
    return super.isChosen;
  }

  @override
  set isChosen(bool value) {
    _$isChosenAtom.reportWrite(value, super.isChosen, () {
      super.isChosen = value;
    });
  }

  final _$_Desafio1StoreBaseActionController =
      ActionController(name: '_Desafio1StoreBase');

  @override
  void setNumPosition(int value) {
    final _$actionInfo = _$_Desafio1StoreBaseActionController.startAction(
        name: '_Desafio1StoreBase.setNumPosition');
    try {
      return super.setNumPosition(value);
    } finally {
      _$_Desafio1StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnswerCorrent(String value) {
    final _$actionInfo = _$_Desafio1StoreBaseActionController.startAction(
        name: '_Desafio1StoreBase.setAnswerCorrent');
    try {
      return super.setAnswerCorrent(value);
    } finally {
      _$_Desafio1StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOpc(String value) {
    final _$actionInfo = _$_Desafio1StoreBaseActionController.startAction(
        name: '_Desafio1StoreBase.setOpc');
    try {
      return super.setOpc(value);
    } finally {
      _$_Desafio1StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChosen(bool value) {
    final _$actionInfo = _$_Desafio1StoreBaseActionController.startAction(
        name: '_Desafio1StoreBase.setChosen');
    try {
      return super.setChosen(value);
    } finally {
      _$_Desafio1StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numPosition: ${numPosition},
answerCorrent: ${answerCorrent},
opcEscolhida: ${opcEscolhida},
isChosen: ${isChosen}
    ''';
  }
}
