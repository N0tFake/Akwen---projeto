// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group2_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Group2Store on _Group2StoreBase, Store {
  final _$numDesafioAtom = Atom(name: '_Group2StoreBase.numDesafio');

  @override
  int get numDesafio {
    _$numDesafioAtom.reportRead();
    return super.numDesafio;
  }

  @override
  set numDesafio(int value) {
    _$numDesafioAtom.reportWrite(value, super.numDesafio, () {
      super.numDesafio = value;
    });
  }

  final _$ptsAtom = Atom(name: '_Group2StoreBase.pts');

  @override
  int get pts {
    _$ptsAtom.reportRead();
    return super.pts;
  }

  @override
  set pts(int value) {
    _$ptsAtom.reportWrite(value, super.pts, () {
      super.pts = value;
    });
  }

  final _$_Group2StoreBaseActionController =
      ActionController(name: '_Group2StoreBase');

  @override
  void setNumDesfio(int value) {
    final _$actionInfo = _$_Group2StoreBaseActionController.startAction(
        name: '_Group2StoreBase.setNumDesfio');
    try {
      return super.setNumDesfio(value);
    } finally {
      _$_Group2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPTS(int value) {
    final _$actionInfo = _$_Group2StoreBaseActionController.startAction(
        name: '_Group2StoreBase.setPTS');
    try {
      return super.setPTS(value);
    } finally {
      _$_Group2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numDesafio: ${numDesafio},
pts: ${pts}
    ''';
  }
}
