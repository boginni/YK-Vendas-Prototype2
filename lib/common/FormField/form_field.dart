import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 
 */
class FormCampo extends StatelessWidget {

  FormCampo({required this.title});

  final String title;

  Widget getTitleText() {
    return Text(
      title,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget getCustomField() {
    return TextField(
      decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: ''
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getTitleText(),
        getCustomField(),
      ],
    );
  }

}