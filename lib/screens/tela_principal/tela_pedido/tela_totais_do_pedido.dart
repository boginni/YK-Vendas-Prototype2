import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:sqflite/sqflite.dart';

class TelaTotaisPedido extends StatelessWidget {
  static const routeName = '/telaTotaisPedido';

  const TelaTotaisPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int idVisita = ModalRoute.of(context)!.settings.arguments as int;

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
              future: BufferTranslator.getTotaisPedido(idVisita),
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
                      title: 'Itens: ',
                      value: t.itens.toString(),
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

class TabelaPreco{
  final int id;

  TabelaPreco(this.id);

}


Future<void> insertTotais(final int idVisita, final TabelaPreco x) async {
  try {
    final db = await DatabaseLocal.getDatabase();
    await db.insert(
      'CP_VISITA_TABELA',
      {'ID_VISITA': idVisita, 'ID_TABELA_PRECOS': x.id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  } catch (e) {
    debugPrint(e.toString());
  }
}

