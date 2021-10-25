import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white
      ), 
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
        width: screen.width * 0.4,
        height: screen.height * 0.06,
        child: const Center(
          child: Text('Login')
        ),
      ),

      onPressed: (){},

    );
  }
}