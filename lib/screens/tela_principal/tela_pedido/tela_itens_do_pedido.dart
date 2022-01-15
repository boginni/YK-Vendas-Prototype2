import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_adicionar_item.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_item_do_pedido.dart';
import 'package:sqflite/sqflite.dart';

class TelaItensPedido extends StatelessWidget {
  static const routeName = '/telaItensPedido';

  const TelaItensPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Visita visita = ModalRoute.of(context)!.settings.arguments as Visita;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Itens do Pedido'),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.of(context).pushNamed(TelaAdicionarItem.routeName, arguments: visita);
              },
              child: const Icon(CupertinoIcons.add_circled_solid),
            )
          ]

      ),
      body: ListView(
        children: [

          FutureBuilder(
            future: BufferTranslator.getItensVisita(visita.id),
            builder: (BuildContext context,
                AsyncSnapshot<List<ItemVisita>> snapshot) {
              if (snapshot.hasData) {
                List<ItemVisita> list = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int i) {
                    final ItemVisita item = list[i];

                    return TileButton(
                      icon: CupertinoIcons.cube_box,
                      title: item.produto.nome +
                          ' - ' +
                          item.quantidade.toString() +
                          'x',
                      onPressMethod: () {
                        Navigator.of(context).pushNamed(
                            TelaItemPedido.routeName,
                            arguments: [item, visita]);
                      },
                    );
                  },
                );
              } else {
                return const Text('Carregando dados');
              }
            },
          ),
        ],
      ),
    );
  }
}

Future<List<Produto>> getProdutos() async {
  final Database db = await DatabaseLocal.getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('produtos');

  return List.generate(maps.length, (i) {
    return Produto(idProduto: maps[i]['id'], nome: maps[i]['nome']);
  });
}
