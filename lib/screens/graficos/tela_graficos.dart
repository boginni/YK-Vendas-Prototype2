import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaGraficos extends ModdelScreen {
  const TelaGraficos({Key? key}) : super(key: key);

  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Gráficos')),
        drawer: const CustomDrawer(),
        body: FutureBuilder(
          future: BufferTranslator.getGraphList(),
          builder: (BuildContext context, AsyncSnapshot<List<Graph>> snapshot) {
            if (snapshot.hasData) {
              List<Graph> itens = snapshot.data!;

              if (itens.isEmpty) {
                return const Text("Sem dados pra carregar");
              }

              return ListView.builder(
                itemCount: itens.length,
                itemBuilder: (BuildContext context, int index) {
                  return TileGraph(itens[index]);
                },
              );
            }

            return const Text("Carregando dados");
          },
        ));
  }
}
