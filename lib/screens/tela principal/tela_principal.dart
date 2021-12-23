import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Força de Vendas"),
      ),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
