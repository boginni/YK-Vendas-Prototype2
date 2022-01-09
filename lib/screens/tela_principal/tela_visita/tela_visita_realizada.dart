import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaVisitaRealizada extends StatelessWidget {

  const TelaVisitaRealizada({Key? key}) : super(key: key);

  static const routeName = '/visitaRealizada' ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visita Realizada'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Card(
        child: ListView(
          children: const <Widget> [
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
    );
  }
}
