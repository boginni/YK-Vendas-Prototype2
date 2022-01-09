import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaPrincipal extends ModdelScreen{
  const TelaPrincipal({Key? key}) : super(key: key);


  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Força de Vendas"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.search, size: 26.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.sync, size: 26.0),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[50],
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: BufferTranslator.getVisitas(),
        builder: (BuildContext context, AsyncSnapshot<List<Visita>> snapshot) {
          if (snapshot.hasData) {
            List<Visita> visitas = snapshot.data!;

            return ListView.builder(
              itemCount: visitas.length,
              itemBuilder: (BuildContext context, int index) {
                return TileVisita(visita: visitas[index]);
              },
            );

          } else {
            return const Text('Carregando dados');
          }

        },
      ),
    );
  }
}