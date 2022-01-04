import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/form_field/formulario.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaIncluirVisitaAgenda extends ModdelScreen {
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incluir Visita na Agenda'),
      ),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FormText(saveFunction: (_) {}, title: 'Cliente'),
          FormText(
              saveFunction: (_) {},
              title: 'Pesquisar por',
              mandatoryField: true),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.check_sharp,
          size: 32,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
