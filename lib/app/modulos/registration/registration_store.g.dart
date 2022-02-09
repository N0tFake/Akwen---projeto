// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistrationStore on _RegistrationStoreBase, Store {
  final _$emailAtom = Atom(name: '_RegistrationStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegistrationStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$usernameAtom = Atom(name: '_RegistrationStoreBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

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

  final _$_RegistrationStoreBaseActionController =
      ActionController(name: '_RegistrationStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegistrationStoreBaseActionController.startAction(
        name: '_RegistrationStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegistrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegistrationStoreBaseActionController.startAction(
        name: '_RegistrationStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegistrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_RegistrationStoreBaseActionController.startAction(
        name: '_RegistrationStoreBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_RegistrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
email: ${email},
password: ${password},
username: ${username},
isStudent: ${isStudent},
hintPassword: ${hintPassword},
hintConfirmPassword: ${hintConfirmPassword}
    ''';
  }
}
