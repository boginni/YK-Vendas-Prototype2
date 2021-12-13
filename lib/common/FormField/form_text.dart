import 'package:flutter/material.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';

import 'form_field.dart';

class FormText extends FormCampo {
  FormText({required this.saveFunction(String)?, this.initialValue = ""}) : super() {

  }


  String initialValue;
  Function(String?)? saveFunction;

  @override
  Widget getCustomField() {
    // TODO: implement getCustomField

    return TextFormField(
      maxLines: null,
      initialValue: initialValue,
      textAlignVertical: TextAlignVertical.bottom,
      style: TextStyle(fontSize: fontSize),
      autocorrect: false,
      validator: (text) {
        if (mandatoryField && text!.isEmpty) {
          return "Campo Obrigatório";
        }
        return null;
      },
      onSaved: saveFunction,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        // border: OutlineInputBorder(),
        hintText: '',
      ),
    );
    ;
  }
}

class FormPass extends FormCampo {
  final TextEditingController passController = TextEditingController();

  Widget getCustomField() {
    return TextFormField(
      controller: passController,
      // enabled: !UserManager.loading,
      decoration: const InputDecoration(hintText: 'Senha'),
      autocorrect: false,
      obscureText: true,
      validator: (pass) {
        if (pass!.isEmpty || pass.length < 6) return 'Senha inválida';
        return null;
      },
    );
  }
}

class FormDataNascimento extends FormCampo {
  @override
  Widget getCustomField() {
    // TODO: implement getCustomField
    return Text('Not Implemented');
  }
}
