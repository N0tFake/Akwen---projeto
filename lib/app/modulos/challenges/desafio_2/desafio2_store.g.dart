// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desafio2_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Desafio2Store on _Desafio2StoreBase, Store {
  final _$posCorrentAtom = Atom(name: '_Desafio2StoreBase.posCorrent');

  @override
  int get posCorrent {
    _$posCorrentAtom.reportRead();
    return super.posCorrent;
  }

  @override
  set posCorrent(int value) {
    _$posCorrentAtom.reportWrite(value, super.posCorrent, () {
      super.posCorrent = value;
    });
  }

  final _$answerCorrentAtom = Atom(name: '_Desafio2StoreBase.answerCorrent');

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

  final _$numPositionAtom = Atom(name: '_Desafio2StoreBase.numPosition');

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

  final _$isCorrentAtom = Atom(name: '_Desafio2StoreBase.isCorrent');

  @override
  bool get isCorrent {
    _$isCorrentAtom.reportRead();
    return super.isCorrent;
  }

  @override
  set isCorrent(bool value) {
    _$isCorrentAtom.reportWrite(value, super.isCorrent, () {
      super.isCorrent = value;
    });
  }

  final _$isChosenAtom = Atom(name: '_Desafio2StoreBase.isChosen');

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

  final _$_Desafio2StoreBaseActionController =
      ActionController(name: '_Desafio2StoreBase');

  @override
  void setPosCorrent(int value) {
    final _$actionInfo = _$_Desafio2StoreBaseActionController.startAction(
        name: '_Desafio2StoreBase.setPosCorrent');
    try {
      return super.setPosCorrent(value);
    } finally {
      _$_Desafio2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnswerCorrent(String value) {
    final _$actionInfo = _$_Desafio2StoreBaseActionController.startAction(
        name: '_Desafio2StoreBase.setAnswerCorrent');
    try {
      return super.setAnswerCorrent(value);
    } finally {
      _$_Desafio2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumPosition(int value) {
    final _$actionInfo = _$_Desafio2StoreBaseActionController.startAction(
        name: '_Desafio2StoreBase.setNumPosition');
    try {
      return super.setNumPosition(value);
    } finally {
      _$_Desafio2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsCorrent(bool value) {
    final _$actionInfo = _$_Desafio2StoreBaseActionController.startAction(
        name: '_Desafio2StoreBase.setIsCorrent');
    try {
      return super.setIsCorrent(value);
    } finally {
      _$_Desafio2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChosen(bool value) {
    final _$actionInfo = _$_Desafio2StoreBaseActionController.startAction(
        name: '_Desafio2StoreBase.setChosen');
    try {
      return super.setChosen(value);
    } finally {
      _$_Desafio2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posCorrent: ${posCorrent},
answerCorrent: ${answerCorrent},
numPosition: ${numPosition},
isCorrent: ${isCorrent},
isChosen: ${isChosen}
    ''';
  }
}
