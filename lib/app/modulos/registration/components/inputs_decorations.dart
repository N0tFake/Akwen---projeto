 import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/utils/schemas.dart';
import 'package:flutter_akwen/app/modulos/registration/registration_store.dart';

InputDecoration InputDecorationCustom(String hintText){
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: Colors.white,

    disabledBorder: OutlineInputBorderCustom(false, false),

    focusedBorder: OutlineInputBorderCustom(false, true),
    enabledBorder: OutlineInputBorderCustom(false, false),

    errorBorder: OutlineInputBorderCustom(true, false),
    focusedErrorBorder: OutlineInputBorderCustom(true, false),
  );
}

InputDecoration InputDecorationPasswordCustom(RegistrationStore store, String type){
  return InputDecoration(
    hintText: '********',
    filled: true,
    fillColor: Colors.white,

    focusedBorder: OutlineInputBorderCustom(false, true),
    enabledBorder:OutlineInputBorderCustom(false, false),

    errorBorder: OutlineInputBorderCustom(true, false),
    focusedErrorBorder: OutlineInputBorderCustom(true, false),

    suffixIcon: type == 'password' 
      ? IconButton(
        onPressed: () =>
          store.setHintPassword(!store.hintPassword),
        color: store.hintPassword ? Colors.grey : greenColor,
        icon: Icon(store.hintPassword
          ? Icons.visibility
          : Icons.visibility_off),
      ) 
      : IconButton(
        onPressed: () => store.sethintConfirmPassword(
          !store.hintConfirmPassword),
        color: store.hintConfirmPassword ? Colors.grey : greenColor,
        icon: Icon(store.hintConfirmPassword
          ? Icons.visibility
          : Icons.visibility_off)
      ),
    
  );
}

OutlineInputBorder OutlineInputBorderCustom(bool error, bool focus){
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: error 
        ? Colors.red 
        : focus 
          ? greenColor 
          : Colors.transparent, width: 2),
    borderRadius: const BorderRadius.all(
      Radius.circular(25.0), 
    ),
  );
}