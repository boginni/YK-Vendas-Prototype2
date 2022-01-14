import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_item_do_pedido.dart';
import 'package:sqflite/sqflite.dart';

class TelaAdicionarItem extends StatelessWidget {
  static const routeName = '/telaAdicionarItem';

  const TelaAdicionarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Visita visita = ModalRoute.of(context)!.settings.arguments as Visita;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Item'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),

      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.left_chevron,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Categoria',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('not implemented');
                  },
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.right_chevron,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 48,
          ),
          FutureBuilder(
            future: BufferTranslator.getProdutoList(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Produto>> snapshot) {
              if (snapshot.hasData) {
                List<Produto> produtos = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: produtos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Produto curProduto = produtos[index];

                    return TileButton(
                      icon: CupertinoIcons.cube_box,
                      title: curProduto.nome,
                      onPressMethod: () {
                        Navigator.of(context).pushNamed(TelaItemPedido.routeName,
                            arguments: [curProduto, visita] );
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
    return Produto(id: maps[i]['id'], nome: maps[i]['nome']);
  });
}
