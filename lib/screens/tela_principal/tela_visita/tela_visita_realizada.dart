import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaVisitaRealizada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visita Realizada'),
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
                title: 'Motivo Cancelamento Visita',
                value: 'Not Implemented',
              ),
              TileText(
                title: 'Observação',
                value: 'Not Implemented',
              ),
              TileText(
                title: 'Foto',
                value: 'Not Implemented',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
