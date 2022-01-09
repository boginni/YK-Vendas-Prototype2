import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaDadosEntrega extends StatelessWidget {

  static const routeName = '/TelaDadosEntrega';

  const TelaDadosEntrega({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados da Entrega'),
        leading: BackButton(
          onPressed: () =>
              Navigator.of(context).pop(context),
        ),
      ),
      body: Card(
        child: ListView(
          children: const <Widget>[
            TileText(title: 'Data',value: 'Not Implemented',),
            TileText(title: 'Restrição de Horário',value: 'Not Implemented',),
            TileText(title: 'Observações',value: 'Not Implemented',),
          ],
        ),
      ),
    );
  }
}
