import 'package:flutter/material.dart';
import 'package:flutter_akwen/app/modulos/challenges/desafio_2/desafio2_store.dart';
import 'package:flutter_akwen/app/modulos/challenges/group/group_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({ Key? key, required this.listImages}) : super(key: key);
  final List<String> listImages;
  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  Desafio2Store store = Modular.get();
   final GroupStore storeGroup = Modular.get();
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    List<String> value = [
      'Errada1',
      'Errada2',
      'Errada3'
    ];
    return Observer(builder: (_) {
      for(var i=0; i<3; i++){
        if(widget.listImages[i] == widget.listImages[store.posCorrent]){
          value[i] = 'Certo';
        }
      }
      return Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            primary: false,
            children: [
              RadioListTile(
                title: SizedBox(
                  width: 100, height: 100,
                  child: Image.network(widget.listImages[0]),
                ),
                value: value[0], 
                groupValue: groupValue,
                onChanged: (value){
                  store.setChosen(true);
                  value == 'Certo' ? store.setIsCorrent(true): store.setIsCorrent(false); 
                  print(value);
                  setState(() {
                    groupValue = value as String?;
                  });
                }
              ),
              RadioListTile(
                title: SizedBox(
                  width: 100, height: 100,
                  child: Image.network(widget.listImages[1]),
                ),
                value: value[1], 
                groupValue: groupValue,
                onChanged: (value){
                  store.setChosen(true);
                  value == 'Certo' ? store.setIsCorrent(true): store.setIsCorrent(false); 
                  print(value);
                  setState(() {
                    groupValue = value as String?;
                  });
                }
              ),
              RadioListTile(
                title: SizedBox(
                  width: 100, height: 100,
                  child: Image.network(widget.listImages[2]),
                ),
                value: value[2], 
                groupValue: groupValue,
                onChanged: (value){
                  store.setChosen(true);
                  value == 'Certo' ? store.setIsCorrent(true): store.setIsCorrent(false); 
                  print(value);
                  setState(() {
                    groupValue = value as String?;
                  });
                }
              ),
            ],
          ),
        ),
      );
    });
  }
}