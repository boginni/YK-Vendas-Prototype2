import 'package:flutter/material.dart';
import 'package:loja_virtual/common/tiles/default_tiles.dart';

class TelaTotaisPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Totais do pedido'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            TileText(
              title: 'Total do Pedido',
              value: 'R\$ 0,00',
            ),
            TileText(
              title: 'Total do Pedido',
              value: 'R\$ 0,00',
            ),
            TileText(
              title: 'Prazo de Pagamento',
              value: 'Not Implemented',
            ),
            TileText(
              title: 'Observação da NF',
              value: 'Not Implemented',
            ),
            TileText(
              title: 'Assinatura',
              value: 'Not Implemented',
            ),



          ],
        ),
      ),
    );
  }
}
