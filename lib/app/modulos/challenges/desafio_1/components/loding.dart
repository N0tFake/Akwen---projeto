import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/components/img_background.dart';

class LoadingChallenge extends StatefulWidget {
  const LoadingChallenge({ Key? key, required this.color }) : super(key: key);
  final Color color;

  @override
  State<LoadingChallenge> createState() => _LoadingChallengeState();
}

class _LoadingChallengeState extends State<LoadingChallenge> {

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: ImgBackground(
        child: Center(
          child:  Text('Carregando ...', style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 50,
            fontWeight: FontWeight.w800,
            color: widget.color
          ),),
        ),
      ),
    );
  }
}