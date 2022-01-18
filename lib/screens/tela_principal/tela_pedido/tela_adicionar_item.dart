import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_item_do_pedido.dart';
import 'package:sqflite/sqflite.dart';

class testItens {
  late final String name;

  String getName() {
    return name;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class TelaAdicionarItem extends StatelessWidget {
  static const routeName = '/telaAdicionarItem';

  const TelaAdicionarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int idVisita = ModalRoute.of(context)!.settings.arguments as int;

    List<testItens> categorias = [
      testItens()..name = "name 1",
      testItens()..name = "name 2"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Item'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
        actions: [
          TextButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: const Icon(
              CupertinoIcons.check_mark_circled,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: [







          //TODO: Desativado para ser substituido
          // Flex(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   // crossAxisAlignment: CrossAxisAlignment.stretch,
          //   direction: Axis.horizontal,
          //   children: [
          //     Align(
          //       alignment: Alignment.centerLeft,
          //       child: ElevatedButton(
          //         onPressed: () {},
          //         child: const Center(
          //           child: Icon(
          //             CupertinoIcons.left_chevron,
          //             size: 32,
          //             color: Colors.grey,
          //           ),
          //         ),
          //       ),
          //     ),
          //     const Align(
          //       alignment: Alignment.center,
          //       child: Text(
          //         'Categoria',
          //         style: TextStyle(fontSize: 18),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.centerRight,
          //       child: ElevatedButton(
          //         onPressed: () {
          //           debugPrint('not implemented');
          //         },
          //         child: const Center(
          //           child: Icon(
          //             CupertinoIcons.right_chevron,
          //             size: 32,
          //             color: Colors.grey,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          //TODO: Desativado por precisar de update após edição de Item
          // Container(
          //   color: Colors.white,
          //   child: FutureBuilder(
          //     future: BufferTranslator.getTotaisPedido(visita.id),
          //     builder:
          //         (BuildContext context, AsyncSnapshot<TotaisPedido> snapshot) {
          //       TotaisPedido t = TotaisPedido();
          //
          //       if (snapshot.hasData) {
          //         t = snapshot.data!;
          //       }
          //
          //       return Column(
          //         children: [
          //           TileTextFlex("Total: ", t.total.toString()),
          //           TileTextFlex("Itens: ", t.itens.toString()),
          //           TileTextFlex("Quantidade: ", t.quantidade.toString()),
          //         ],
          //       );
          //     },
          //   ),
          // ),
          const Divider(),
          FutureBuilder(
            future: _getProdutoList(idVisita),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProdutoItemList>> snapshot) {
              if (snapshot.hasData) {
                List<ProdutoItemList> itens = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: itens.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TileItemPedido(itens[index]);
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

class ProdutoItemList {
  int quantidade = 0;
  String unidade = "";
  double total = 0;
  bool editavel = false;

  String nome = "";
  int idProduto = 0;
  late final int idVisita;
}

class TileItemPedido extends StatefulWidget {
  TileItemPedido(this.item, {Key? key}) : super(key: key);

  ProdutoItemList item;

  @override
  State<StatefulWidget> createState() => TileItemPedidoState();
}

class TileItemPedidoState extends State<TileItemPedido> {
  toAdd() {
    Navigator.of(context).pushNamed(TelaItemPedido.routeName, arguments: [
      widget.item.idVisita,
      widget.item.idProduto
    ]).then((value) => refresh());
  }

  Future<void> refresh() async {
    final newItem =
        await _getProduto(widget.item.idVisita, widget.item.idProduto);
    setState(() {
      widget.item = newItem;
    });
  }

  toTrash() async {
    debugPrint('Delete item');

    await disableVisitaItem(widget.item.idVisita, widget.item.idProduto);

    setState(() {
      widget.item.editavel = false;
    });
  }

  Container getEditableTile() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 5,
            child: TextButton(
              onPressed: toAdd,
              child: Flex(
                mainAxisSize: MainAxisSize.max,
                direction: Axis.horizontal,
                children: [
                  Text(
                    widget.item.quantidade.toString() + "x",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Stack(
                    fit: StackFit.loose,
                    children: const <Widget>[
                      Icon(
                        CupertinoIcons.cube_box,
                        size: 48,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.nome,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                        const Divider(),
                        Text(
                          "Total do pedido: R\$" + widget.item.total.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: toTrash,
              child: const Icon(
                CupertinoIcons.trash,
                size: 32,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container getStandartTile() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      color: Colors.white,
      child: TextButton(
        onPressed: toAdd,
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          direction: Axis.horizontal,
          children: [
            const Icon(
              CupertinoIcons.cube_box,
              size: 48,
            ),
            Expanded(
              child: Text(
                widget.item.nome,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.item.editavel ? getEditableTile() : getStandartTile();
  }
}

Future<List<ProdutoItemList>> _getProdutoList(int idVisita) async {
  final Database db = await DatabaseLocal.getDatabase();

  String args = 'ID_VISITA = ? ';

  List<dynamic> param = [idVisita];

  final List<Map<String, dynamic>> maps =
      await db.query('VW_PRODUTO_LIST', where: args, whereArgs: param);

  return _mapToList(maps);
}

Future<ProdutoItemList> _getProduto(int idVisita, int idProduto) async {
  final Database db = await DatabaseLocal.getDatabase();

  String args = 'ID_VISITA = ? and  ID_PRODUTO = ?';

  List<dynamic> param = [idVisita, idProduto];

  final List<Map<String, dynamic>> maps =
      await db.query('VW_PRODUTO_LIST', where: args, whereArgs: param);

  return _mapToList(maps)[0];
}

List<ProdutoItemList> _mapToList(List<Map<String, dynamic>> maps) {
  return List.generate(maps.length, (i) {
    final x = ProdutoItemList();
    x.idVisita = maps[i]['ID_VISITA'];
    x.nome = maps[i]['NOME'];
    x.editavel = maps[i]['EDITAVEL'] == 0 ? false : true;
    x.idProduto = maps[i]['ID_PRODUTO'];

    if (x.editavel) {
      x.quantidade = maps[i]['QUANTIDADE'];
      x.total = maps[i]['TOTAL'].toDouble();
    }
    return x;
  });
}

Future<void> disableVisitaItem(int idVisita, int idProduto) async {
  final db = await DatabaseLocal.getDatabase();

  await db.update('CP_VISITA_ITEM', {'STATUS': 2},
      where: 'ID_VISITA = ? AND ID_PRODUTO = ?',
      whereArgs: [idVisita, idProduto]);
}
