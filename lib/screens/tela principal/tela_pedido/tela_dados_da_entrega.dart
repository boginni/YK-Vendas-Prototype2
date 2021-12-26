import 'package:flutter/material.dart';
import 'package:loja_virtual/common/tiles/default_tiles.dart';

class TelaDadosEntrega extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados da Entrega'),
        leading: BackButton(
          onPressed: () =>
              Navigator.of(context).pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            TileText(title: 'Data',value: 'Not Implemented',),
            TileText(title: 'Restrição de Horário',value: 'Not Implemented',),
            TileText(title: 'Observações',value: 'Not Implemented',),
          ],
        ),
      ),
    );
  }
}
