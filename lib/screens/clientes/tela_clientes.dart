import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';

class TelaClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Container(
        child: FutureBuilder(
          future: getClientes(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Cliente>> snapshot) {
            if (snapshot.hasData) {
              List<Cliente> clientes = snapshot.data!;
              int size = clientes.length;

              if(size == 0){
                return Text('Sem dados para Carregar', textAlign: TextAlign.center,);
              }

              return ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (BuildContext context, int index) {
                  final curCliente = clientes[index];
                  return TileCliente(cliente: curCliente);
                },

              );
            } else {
              return Text('Carregando Dados');
            }


          },
        ),
      ),
    );
  }
}

Future<List<Cliente>> getClientes() async{
  final db = await DatabaseLocal.getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('clientes');

  return List.generate(maps.length, (i) {
    return Cliente(
      maps[i]['nome'],
    );
  });
}

