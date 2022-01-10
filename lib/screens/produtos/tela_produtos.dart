import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/produtos/tela_novo_produto.dart';
import 'package:sqflite/sqflite.dart';

class TelaProdutos extends StatelessWidget {
  const TelaProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pushNamed(TelaNovoProduto.routeName);
            },
            child: const Icon(CupertinoIcons.add_circled_solid),
          )
        ],
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.of(context).pop(context);
        //   },
        // ),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {},
                        // color: Colors.white,
                        child: const Center(
                            child: Icon(
                          CupertinoIcons.left_chevron,
                          size: 32,
                        )),
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
                        // color: Colors.white,
                        onPressed: () {},
                        child: const Center(
                            child: Icon(
                          CupertinoIcons.right_chevron,
                          size: 32,
                        )),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),
                const Divider(),
              ],
            ),
          ),
          FutureBuilder(
            future: getProdutos(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Produto>> snapshot) {
              if (snapshot.hasData) {
                List<Produto> produtos = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: produtos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Produto curProduto = produtos[index];
                    return TileProduto(produto: curProduto);
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
