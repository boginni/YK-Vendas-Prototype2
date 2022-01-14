import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';

class TelaTotaisPedido extends StatelessWidget {
  static const routeName = '/telaTotaisPedido';

  const TelaTotaisPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Visita visita = ModalRoute.of(context)!.settings.arguments as Visita;

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
          children: <Widget>[
            FutureBuilder(
              future: BufferTranslator.getTotaisPedido(visita.id),
              builder:
                  (BuildContext context, AsyncSnapshot<TotaisPedido> snapshot) {
                TotaisPedido t = TotaisPedido();

                if (snapshot.hasData) {
                  t = snapshot.data!;
                }

                return Column(
                  children: [
                    TileText(
                      title: 'Total do Pedido',
                      value: 'R\$' + t.total.toString(),
                    ),
                    TileText(
                      title: 'Total do Pedido Liquido',
                      value: 'R\$' + t.total.toString(),
                    ),
                  ],
                );
              },
            ),
            const TileText(
              title: 'Prazo de Pagamento',
              value: 'Not Implemented',
            ),
            const TileText(
              title: 'Observação da NF',
              value: 'Not Implemented',
            ),
            const TileText(
              title: 'Assinatura',
              value: 'Not Implemented',
            ),
          ],
        ),
      ),
    );
  }
}
