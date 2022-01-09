import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:sqflite/sqflite.dart';

class TelaProdutos extends StatelessWidget {
  const TelaProdutos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.of(context).pop(context);
        //   },
        // ),
      ),
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.white,
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
                child: RaisedButton(
                  color: Colors.white,
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
          const Divider(),
          const SizedBox(
            height: 48,
          ),
          FutureBuilder(
            future: getProdutos(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Produto>> snapshot) {
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
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/telaNovoProduto');
        },
        child: const Text(
          "Adicionar",
          style: TextStyle(fontSize: 18),
        ),
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
