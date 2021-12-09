import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';

class FormImage extends FormCampo{
  FormImage({required title}) : super(title: title);

  @override
  Widget getCustomField() {
    return Text(
      title,
      style: TextStyle(fontSize: 16),
    );
  }

}