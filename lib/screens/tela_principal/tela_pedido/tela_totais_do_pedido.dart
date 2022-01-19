import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_fields.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:sqflite/sqflite.dart';

class TelaTotaisPedido extends StatefulWidget {
  static const routeName = '/telaTotaisPedido';

  const TelaTotaisPedido({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TelaTotaisPedidoState();
}

class TelaTotaisPedidoState extends State<TelaTotaisPedido> {
  DropdownSavedValue? forma;

  @override
  Widget build(BuildContext context) {
    final int idVisita = ModalRoute.of(context)!.settings.arguments as int;

    saveTotais() async{
      debugPrint(forma.toString());

      await insertTotais(idVisita, forma!.id);

      Navigator.of(context).pop(context);
    }

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
            const Text('Forma de pagamento'),
            Dropdownsaved(
              Dropdownsaved.formaPagamento,
              onChange: (item) {
                setState(() {
                  forma = item;
                });
              },
              currentValue: forma,
            ),
            const TileText(
              title: 'Observação da NF',
              value: 'Not Implemented',
            ),
            const TileText(
              title: 'Assinatura',
              value: 'Not Implemented',
            ),
            TextButton(
              onPressed: forma != null ? () => saveTotais() : null,
              child: const Text(
                "Salvar",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> insertTotais(
    final int idVisita, final int idFormaPagamento) async {
  try {
    final db = await DatabaseLocal.getDatabase();
    await db.insert(
      'CP_VISITA_VENDA',
      {'ID_VISITA': idVisita, 'ID_FORMA_PAGAMENTO': idFormaPagamento},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}
