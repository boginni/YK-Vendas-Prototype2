import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/common/form_field/form_text.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaIncluirVisitaAgenda extends ModdelScreen{
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Incluir Visita na Agenda'),),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FormText(saveFunction: (_){})..title = 'Cliente',
          FormText(saveFunction: (_){})..title = 'Pesquisar por'..mandatoryField = true
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


