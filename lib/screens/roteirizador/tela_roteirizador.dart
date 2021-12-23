import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaRoteirizador extends ModdelScreen{
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Roteirizador'),),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Tela de Roteirização'),
      ),
    );
  }

}