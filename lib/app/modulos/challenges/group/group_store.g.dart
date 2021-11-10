// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupStore on _GroupStoreBase, Store {
  final _$visible1Atom = Atom(name: '_GroupStoreBase.visible1');

  @override
  bool get visible1 {
    _$visible1Atom.reportRead();
    return super.visible1;
  }

  @override
  set visible1(bool value) {
    _$visible1Atom.reportWrite(value, super.visible1, () {
      super.visible1 = value;
    });
  }

  final _$visible2Atom = Atom(name: '_GroupStoreBase.visible2');

  @override
  bool get visible2 {
    _$visible2Atom.reportRead();
    return super.visible2;
  }

  @override
  set visible2(bool value) {
    _$visible2Atom.reportWrite(value, super.visible2, () {
      super.visible2 = value;
    });
  }

  final _$visible3Atom = Atom(name: '_GroupStoreBase.visible3');

  @override
  bool get visible3 {
    _$visible3Atom.reportRead();
    return super.visible3;
  }

  @override
  set visible3(bool value) {
    _$visible3Atom.reportWrite(value, super.visible3, () {
      super.visible3 = value;
    });
  }

  final _$_GroupStoreBaseActionController =
      ActionController(name: '_GroupStoreBase');

  @override
  void setVisible1(bool value) {
    final _$actionInfo = _$_GroupStoreBaseActionController.startAction(
        name: '_GroupStoreBase.setVisible1');
    try {
      return super.setVisible1(value);
    } finally {
      _$_GroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisible2(bool value) {
    final _$actionInfo = _$_GroupStoreBaseActionController.startAction(
        name: '_GroupStoreBase.setVisible2');
    try {
      return super.setVisible2(value);
    } finally {
      _$_GroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisible3(bool value) {
    final _$actionInfo = _$_GroupStoreBaseActionController.startAction(
        name: '_GroupStoreBase.setVisible3');
    try {
      return super.setVisible3(value);
    } finally {
      _$_GroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visible1: ${visible1},
visible2: ${visible2},
visible3: ${visible3}
    ''';
  }
}
