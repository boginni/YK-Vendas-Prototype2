
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';

class FormDropDown extends FormCampo{
  FormDropDown({required title}) : super(title: title);

  var itens = <String>[];

  @override
  Widget getCustomField() {
    String dropdownValue = 'One';

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        //
        // setState(() {
        //   dropdownValue = newValue!;
        // });
      },
      items: itens
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }


}

/*




 */