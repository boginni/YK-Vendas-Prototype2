import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

abstract class FormCampo extends StatelessWidget {
  //({Key? key, mandatoryField, title}) : super(key: key, mandatoryField: mandatoryField, title: title);
  FormCampo({Key? key, required this.title, this.mandatoryField = false})
      : super(key: key);

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
        Text(mandatoryField ? " *" : "", style: TextStyle(fontSize: fontSize))
      ],
    );
  }

  Widget getCustomField();

  Widget getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [getTitleText(), getCustomField()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: defaultSideSpace,
            bottom: defaultBottonSpace,
            right: defaultSideSpace),
        child: getContent());
  }
}

abstract class FormDropDown extends FormCampo {
  var itens = <String>[];
  String dropdownValue = 'One';

  FormDropDown({Key? key, mandatoryField, title})
      : super(key: key, mandatoryField: mandatoryField = false, title: title);

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
      items: itens.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class FormText extends FormCampo {
  FormText(
      {Key? key,
      required this.saveFunction(String)?,
      this.initialValue = "",
      mandatoryField = false,
      title})
      : super(key: key, mandatoryField: mandatoryField = false, title: title);

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

  FormPass({Key? key, mandatoryField, title})
      : super(key: key, mandatoryField: mandatoryField = false, title: title);

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
  FormDataNascimento({Key? key, mandatoryField = false, title})
      : super(key: key, mandatoryField: mandatoryField, title: title);

  @override
  Widget getCustomField() {
    // TODO: implement getCustomField
    return Text('Not Implemented');
  }
}

class FormSwitch extends FormCampo {
  FormSwitch({Key? key, mandatoryField  = false, title})
      : super(key: key, mandatoryField: mandatoryField, title: title);

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

  @override
  Widget getContent() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              getTitleText(),
              getCustomField(),
            ],
          ),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}

class FormTipoCliente extends FormDropDown {
  FormTipoCliente({Key? key, mandatoryField = false, title = "Tipo de Cliente"})
      : super(key: key, mandatoryField: mandatoryField, title: title) {
    itens = ['Pessoa Física', 'Pessoa Jurídica'];
    dropdownValue = itens[0];
  }
}

class FormCidade extends FormDropDown {
  FormCidade({Key? key, mandatoryField = false, title = "Cidade"})
      : super(key: key, mandatoryField: mandatoryField, title: title) {
    itens = ['Exemplo 1', 'Exemplo 2'];
    dropdownValue = itens[0];
  }
}

class FormRota extends FormDropDown {
  FormRota({Key? key, mandatoryField = false, title = "Rota"})
      : super(key: key, mandatoryField: mandatoryField, title: title) {
    itens = ['Rota 1', 'Rota 2'];
    dropdownValue = itens[0];
  }
}

class FormIdioma extends FormDropDown {
  FormIdioma({Key? key, mandatoryField = false, title = "Idioma"})
      : super(key: key, mandatoryField: mandatoryField, title: title) {
    itens = ['Nativo', 'Portugês', 'Inglês'];
    dropdownValue = itens[0];
  }
}

class FormTipoTeclado extends FormDropDown {
  FormTipoTeclado({Key? key, mandatoryField = false, title = "Tipo de teclado"})
      : super(key: key, mandatoryField: mandatoryField, title: title) {
    itens = ['Numérico', 'Alfanumérico', 'Latim'];
    dropdownValue = itens[0];
  }
}

class FormOpcoesAdicionaisPesquisa extends FormDropDown {
  FormOpcoesAdicionaisPesquisa({Key? key, mandatoryField = false, title = "Opções Adicionais de Pesquisa"}) : super(key: key, mandatoryField: mandatoryField, title: title)
  {
    itens = ['Nenhum', 'Opção 1'];
    dropdownValue = itens[0];
  }
}

class FormImage extends FormCampo {
  FormImage({Key? key, mandatoryField, required title})
      : super(key: key, mandatoryField: mandatoryField = false, title: title);

  @override
  Widget getCustomField() {
    return Text(
      title,
      style: TextStyle(fontSize: 16),
    );
  }
}
