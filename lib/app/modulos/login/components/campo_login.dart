import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/login/components/textFormField/textFormField.dart';


class CampLogin extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String type;
  const CampLogin({ Key? key, required this.hintText, required this.labelText, required this.type }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        TextForm(hintText: hintText, type: type),
      ],
    );
  }
}