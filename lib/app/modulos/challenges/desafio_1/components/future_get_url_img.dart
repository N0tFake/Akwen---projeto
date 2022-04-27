import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/global/services/service.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_1/desafio1_store.dart';
import 'package:flutter_modular/flutter_modular.dart';


class GetImg extends StatefulWidget {
  const GetImg({ Key? key, required this.progressColor }) : super(key: key);
  final Color progressColor;


  @override
  _GetImgState createState() => _GetImgState();
}

class _GetImgState extends State<GetImg> {
  final Services service = Modular.get();
  Desafio1Store store = Modular.get();
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft:  Radius.circular(20)
        ),
      ),
      width: screen.width,
      height: 200,
      child: FutureBuilder(
        future: service.getChallengeDoc('desafio 1'),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if(snapshot.hasData && !snapshot.data!.exists){
            return const Text('Sem imagem');
          }else if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Image.network(data['Imagens'][store.numPosition]);
          } else {
            return Row(
              children: [
                const Text('Carrengando', style: TextStyle(
                  fontFamily: 'Nunito', 
                  fontSize: 20, 
                  fontWeight: FontWeight.w600
                )),
                CircularProgressIndicator(color: widget.progressColor)
              ],
            );
          }
        } 
      ),
    );
  }
}