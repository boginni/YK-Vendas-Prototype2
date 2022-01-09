import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaTabelaPreco extends StatelessWidget {


  static const routeName = '/telaTabelaPreco';

  const TelaTabelaPreco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabela de Preço'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Card(
        child: ListView(
          children: const <Widget>[
            TileText(
              title: 'Tabela de Preço',
              value: 'Not Implemented',
            ),
          ],
        ),
      ),
    );
  }
}
