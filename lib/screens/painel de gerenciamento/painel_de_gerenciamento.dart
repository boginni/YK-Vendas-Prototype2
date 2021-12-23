import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaPainelGerenciamento extends ModdelScreen{
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Painel de Gerenciamento'),),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Isso vai abrir uma guia no navegador'),
      ),
    );
  }

}