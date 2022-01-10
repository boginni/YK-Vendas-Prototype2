import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaRotas extends ModdelScreen {
  const TelaRotas({Key? key}) : super(key: key);

  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rotas'),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: FutureBuilder(
          future: BufferTranslator.getRotas(),
          builder: (BuildContext context, AsyncSnapshot<List<Rota>> snapshot) {
            if (snapshot.hasData) {

              List<Rota> list = snapshot.data!;

              if(list.isEmpty){
                return const Text('Sem dados');
              }

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int i) {
                  return TileRota(list[i]);
                },
              );
            } else {
              return const Text("Carregando Dados");
            }



          },
        ));
  }
}

get() {
  // TileRota(
  //   nome: 'ROTA FLORATA',
  // ),
  // TileRota(
  // nome: 'JOELSON',
  // ),
  // TileRota(
  // nome: 'TERCA-FEIRA 204',
  // ),
  // TileRota(
  // nome: 'Rota Elton',
  // ),
  // TileRota(
  // nome: 'INATIVO',
  // ),
  // TileRota(
  // nome: 'QUARTA-FEIRA 201',
  // ),
  // TileRota(
  // nome: 'TERCA-FEIRA 205',
  // ),
  // TileRota(
  // nome: 'TERCA-FEIRA 201',
  // ),
  // TileRota(
  // nome: 'ROTA HUMBERTO',
  // ),
}
