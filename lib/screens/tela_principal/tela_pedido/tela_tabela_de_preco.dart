import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaTabelaPreco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabela de Preço'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Container(
        child: Card(
          child: ListView(
            children: [
              TileText(
                title: 'Tabela de Prelo',
                value: 'Not Implemented',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
