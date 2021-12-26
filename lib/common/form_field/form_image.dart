import 'package:flutter/cupertino.dart';
import 'form_field.dart';

class FormImage extends FormCampo{


  @override
  Widget getCustomField() {
    return Text(
      title,
      style: TextStyle(fontSize: 16),
    );
  }

}