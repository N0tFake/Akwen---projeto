// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desafio2_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Desafio2Store on _Desafio2StoreBase, Store {
  final _$valueAtom = Atom(name: '_Desafio2StoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_Desafio2StoreBaseActionController =
      ActionController(name: '_Desafio2StoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_Desafio2StoreBaseActionController.startAction(
        name: '_Desafio2StoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_Desafio2StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}