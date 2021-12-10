import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCampo extends StatelessWidget {
  FormCampo({String this.title = "", bool this.mandatoryField = false});

  String title;
  bool mandatoryField;

  double fontSize = 16;

  Widget getTitleText() {
    return Text(
      title,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget getCustomField() {
    return const SizedBox(
      height: 28,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            // border: OutlineInputBorder(),
            hintText: '',

        ),
        // textAlignVertical: TextAlignVertical.bottom,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getTitleText(),
          getCustomField(),
          SizedBox(
            height: 32,
          )
        ],
      ),


    );
  }
}
