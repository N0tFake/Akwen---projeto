// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultadoStore on _ResultadoStoreBase, Store {
  final _$resultadoAtom = Atom(name: '_ResultadoStoreBase.resultado');

  @override
  String get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(String value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  final _$_ResultadoStoreBaseActionController =
      ActionController(name: '_ResultadoStoreBase');

  @override
  void setResultado(String value) {
    final _$actionInfo = _$_ResultadoStoreBaseActionController.startAction(
        name: '_ResultadoStoreBase.setResultado');
    try {
      return super.setResultado(value);
    } finally {
      _$_ResultadoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resultado: ${resultado}
    ''';
  }
}
