import 'package:flutter/material.dart';

class ImgBackground extends StatefulWidget {
  const ImgBackground({ Key? key, required this.child, required this.height }) : super(key: key);
  final Widget child;
  final bool height;

  @override
  State<ImgBackground> createState() => _ImgBackgroundState();
}

class _ImgBackgroundState extends State<ImgBackground> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
        width: screen.width,
        height: widget.height ? screen.height : null,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundos/fundo-grey-light.png'),
            fit: BoxFit.cover
          )
        ),
        child: widget.child
    );
  }
}