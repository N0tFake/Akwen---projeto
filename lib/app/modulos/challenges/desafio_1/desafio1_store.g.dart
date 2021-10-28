// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desafio1_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Desafio1Store on _Desafio1StoreBase, Store {
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

  final _$_Desafio1StoreBaseActionController =
      ActionController(name: '_Desafio1StoreBase');

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
  String toString() {
    return '''
opcEscolhida: ${opcEscolhida}
    ''';
  }
}
