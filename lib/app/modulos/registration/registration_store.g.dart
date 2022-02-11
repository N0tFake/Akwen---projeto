// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistrationStore on _RegistrationStoreBase, Store {
  final _$isStudentAtom = Atom(name: '_RegistrationStoreBase.isStudent');

  @override
  bool get isStudent {
    _$isStudentAtom.reportRead();
    return super.isStudent;
  }

  @override
  set isStudent(bool value) {
    _$isStudentAtom.reportWrite(value, super.isStudent, () {
      super.isStudent = value;
    });
  }

  final _$hintPasswordAtom = Atom(name: '_RegistrationStoreBase.hintPassword');

  @override
  bool get hintPassword {
    _$hintPasswordAtom.reportRead();
    return super.hintPassword;
  }

  @override
  set hintPassword(bool value) {
    _$hintPasswordAtom.reportWrite(value, super.hintPassword, () {
      super.hintPassword = value;
    });
  }

  final _$hintConfirmPasswordAtom =
      Atom(name: '_RegistrationStoreBase.hintConfirmPassword');

  @override
  bool get hintConfirmPassword {
    _$hintConfirmPasswordAtom.reportRead();
    return super.hintConfirmPassword;
  }

  @override
  set hintConfirmPassword(bool value) {
    _$hintConfirmPasswordAtom.reportWrite(value, super.hintConfirmPassword, () {
      super.hintConfirmPassword = value;
    });
  }

  final _$usernameExistAtom =
      Atom(name: '_RegistrationStoreBase.usernameExist');

  @override
  bool get usernameExist {
    _$usernameExistAtom.reportRead();
    return super.usernameExist;
  }

  @override
  set usernameExist(bool value) {
    _$usernameExistAtom.reportWrite(value, super.usernameExist, () {
      super.usernameExist = value;
    });
  }

  final _$registeredAtom = Atom(name: '_RegistrationStoreBase.registered');

  @override
  bool get registered {
    _$registeredAtom.reportRead();
    return super.registered;
  }

  @override
  set registered(bool value) {
    _$registeredAtom.reportWrite(value, super.registered, () {
      super.registered = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RegistrationStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_RegistrationStoreBase.register');

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_RegistrationStoreBaseActionController =
      ActionController(name: '_RegistrationStoreBase');

  @override
  void setIsStudent(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreBaseActionController.startAction(
        name: '_RegistrationStoreBase.setIsStudent');
    try {
      return super.setIsStudent(value);
    } finally {
      _$_RegistrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHintPassword(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreBaseActionController.startAction(
        name: '_RegistrationStoreBase.setHintPassword');
    try {
      return super.setHintPassword(value);
    } finally {
      _$_RegistrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sethintConfirmPassword(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreBaseActionController.startAction(
        name: '_RegistrationStoreBase.sethintConfirmPassword');
    try {
      return super.sethintConfirmPassword(value);
    } finally {
      _$_RegistrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_RegistrationStoreBaseActionController.startAction(
        name: '_RegistrationStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_RegistrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isStudent: ${isStudent},
hintPassword: ${hintPassword},
hintConfirmPassword: ${hintConfirmPassword},
usernameExist: ${usernameExist},
registered: ${registered},
errorMessage: ${errorMessage}
    ''';
  }
}
