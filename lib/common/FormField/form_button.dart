import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';

class FormSwitch extends FormCampo {

  bool _switchValue = true;

  @override
  Widget getCustomField() {
    return CupertinoSwitch(
      value: _switchValue,
      onChanged: (value) {

        // setState(() {
        //   _switchValue = value;
        // });

      },
    );

  }
}