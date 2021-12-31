
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'form_field.dart';

abstract class FormDropDown extends FormCampo{

  var itens = <String>[];
  String dropdownValue = 'One';
  @override
  Widget getCustomField() {
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
        dropdownValue = newValue!;
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


class FormTipoCliente extends FormDropDown {

  FormTipoCliente(){
    itens = ['Pessoa Física', 'Pessoa Jurídica'];
    dropdownValue = itens[0];
  }
}

class FormCidade extends FormDropDown {
  FormCidade(){
    itens = ['Exemplo 1', 'Exemplo 2'];
    dropdownValue = itens[0];
  }
}

class FormRota extends FormDropDown {

  FormRota(){
    itens = ['Rota 1', 'Rota 2'];
    dropdownValue = itens[0];
  }
}




class FormIdioma extends FormDropDown {
  FormIdioma(){
    itens = ['Nativo', 'Portugês', 'Inglês'];
    dropdownValue = itens[0];
  }
}




class FormTipoTeclado extends FormDropDown {
  FormTipoTeclado(){
    itens = ['Numérico', 'Alfanumérico', 'Latim'];
    dropdownValue = itens[0];
  }
}

class FormOpcoesAdicionaisPesquisa extends FormDropDown {
  FormOpcoesAdicionaisPesquisa(){
    itens = ['Nenhum', 'Opção 1'];
    dropdownValue = itens[0];
  }
}


/*




 */