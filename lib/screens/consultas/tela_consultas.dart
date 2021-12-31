import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/common/form_field/formulario.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaConsultas extends ModdelScreen {
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultas')),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Text('Visitas'),
          FormText(
            saveFunction: (_) {},
            title: 'Data Inicial',
            mandatoryField: true,
          ),
          FormText(
            saveFunction: (_) {},
            title: 'Data Final',
            mandatoryField: true,
          ),
          FormText(
            saveFunction: (_) {},
            title: 'Atividade',
            mandatoryField: true,
          ),
          FormText(
            saveFunction: (_) {},
            title: 'Cliente',
          ),
          FormText(
            saveFunction: (_) {},
            title: 'Observação',
          ),
        ],
      ),
    );
  }
}
