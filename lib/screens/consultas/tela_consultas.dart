import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/form_field/formulario.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaConsultas extends ModdelScreen {
  const TelaConsultas({Key? key}) : super(key: key);

  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text('Consultas')),
      drawer: const  CustomDrawer(),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget> [
          const Text('Visitas'),
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
