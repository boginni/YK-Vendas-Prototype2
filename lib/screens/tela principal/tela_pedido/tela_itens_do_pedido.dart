import 'package:flutter/material.dart';

class TelaItensPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens do Pedido'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text('Tela de Pedido'),
        ),
      ),
    );
  }
}
