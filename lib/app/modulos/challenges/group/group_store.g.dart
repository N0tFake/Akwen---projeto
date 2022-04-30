// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupStore on _GroupStoreBase, Store {
  final _$numDesafioAtom = Atom(name: '_GroupStoreBase.numDesafio');

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

  final _$ptsAtom = Atom(name: '_GroupStoreBase.pts');

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

  final _$cacheAtom = Atom(name: '_GroupStoreBase.cache');

  @override
  AudioCache get cache {
    _$cacheAtom.reportRead();
    return super.cache;
  }

  @override
  set cache(AudioCache value) {
    _$cacheAtom.reportWrite(value, super.cache, () {
      super.cache = value;
    });
  }

  final _$playerAtom = Atom(name: '_GroupStoreBase.player');

  @override
  AudioPlayer get player {
    _$playerAtom.reportRead();
    return super.player;
  }

  @override
  set player(AudioPlayer value) {
    _$playerAtom.reportWrite(value, super.player, () {
      super.player = value;
    });
  }

  final _$_GroupStoreBaseActionController =
      ActionController(name: '_GroupStoreBase');

  @override
  void setNumDesfio(int value) {
    final _$actionInfo = _$_GroupStoreBaseActionController.startAction(
        name: '_GroupStoreBase.setNumDesfio');
    try {
      return super.setNumDesfio(value);
    } finally {
      _$_GroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPTS(int value) {
    final _$actionInfo = _$_GroupStoreBaseActionController.startAction(
        name: '_GroupStoreBase.setPTS');
    try {
      return super.setPTS(value);
    } finally {
      _$_GroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numDesafio: ${numDesafio},
pts: ${pts},
cache: ${cache},
player: ${player}
    ''';
  }
}
