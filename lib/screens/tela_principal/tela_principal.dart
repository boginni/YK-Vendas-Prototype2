import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_objects/visita.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaPrincipal extends ModdelScreen{
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Força de Vendas"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search, size: 26.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.sync, size: 26.0),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[50],
      drawer: CustomDrawer(),
      body: Container(

        child: FutureBuilder(
          future: getVisitas(),
          builder: (BuildContext context, AsyncSnapshot<List<Visita>> snapshot) {
            if (snapshot.hasData) {
              List<Visita> visitas = snapshot.data!;

              return ListView.builder(
                itemCount: visitas.length,
                itemBuilder: (BuildContext context, int index) {
                  final Visita curVisita = visitas[index];
                  return TileVisita(visita: curVisita);
                },
              );
            } else {
              return Text('Carregando dados');
            }


          },
        ),
      ),
    );
  }
}

Future<List<Visita>> getVisitas() async {
  Visita test = Visita();

  test.apelido = 'Raimunda Hosana';
  test.nome = "test";
  test.endereco = "Endereço Teste";

  List<Visita> visitas = [test];

  return visitas;
}

// TileVisita(
// nome: 'Raimunda Hosana',
// apelido: 'Paraiso Bar',
// endereco: 'CAPITAO BARRISI, 448 - MILAGRE - CASTANHAL - 68740-001',
// ),
// TileVisita(
// nome: 'Antonio Luca',
// apelido: 'Premium Convenciencia 1581',
// endereco: 'CAPITAO BARRISI, 448 - MILAGRE - CASTANHAL - 68740-001',
// ),
// TileVisita(
// nome: 'Paula Wanessa',
// apelido: 'Paula Dep.de Bebibas 1581',
// endereco: 'RUA ALENCAR, 214 - MULTIRAO - Santa Maria do Para - 68738-000',
// ),
// TileVisita(
// nome: 'Francisco Waldemir',
// apelido: 'Mercantil Moura II 4172',
// endereco: 'ROD CASTCURUCA KM - KM 42 - Curuça - 68750-000',
// ),
// TileVisita(
// nome: 'Welton Moreira',
// apelido: 'REST 1594',
// endereco: 'Endereço',
// ),
// TileVisita(
// nome: 'Edinaldo Nascimento',
// apelido: 'Bar dp Edo',
// endereco: 'Endereço',
// ),
