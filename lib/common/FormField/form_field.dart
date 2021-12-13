import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

abstract class FormCampo extends StatelessWidget {
  FormCampo({String this.title = "", bool this.mandatoryField = false});

  String title;
  bool mandatoryField;

  double fontSize = 16;
  double defaultBottonSpace = 32;
  double defaultSideSpace = 8;

  Widget getTitleText() {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          mandatoryField?" *":"",
          style: TextStyle(fontSize: fontSize)
        )
      ],
    );
  }

  Widget getCustomField();

  Widget getContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getTitleText(),
        getCustomField()
      ],
    );

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultSideSpace, bottom: defaultBottonSpace, right: defaultSideSpace),
      child: getContent()
    );
  }
}
