import 'package:flutter/material.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';


import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';

import 'form_field.dart';

class FormText extends FormCampo {
  final TextEditingController passController = TextEditingController();
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
        if (pass!.isEmpty || pass.length < 6)
          return 'Senha inválida';
        return null;
      },
    );
  }

}


class FormDataNascimento extends FormCampo {

}

