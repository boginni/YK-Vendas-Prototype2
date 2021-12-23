import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaMensagens extends ModdelScreen {
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mensagens'),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Container(
          color: Colors.white,
          child: Center(child: Text('Nem uma mensagem')),
        ));
  }

}