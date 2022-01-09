import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaTotaisPedido extends StatelessWidget {


  static const routeName = '/telaTotaisPedido';

  const TelaTotaisPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Totais do pedido'),
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
