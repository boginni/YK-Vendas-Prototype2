import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/clientes/novo_cliente.dart';

class TelaClientes extends StatelessWidget {
  const TelaClientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pushNamed(TelaNovoCliente.routeName);
            },
            child: const Icon(Icons.person_add_outlined),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: BufferTranslator.getClientes(),
        builder: (BuildContext context, AsyncSnapshot<List<Cliente>> snapshot) {
          if (snapshot.hasData) {
            List<Cliente> clientes = snapshot.data!;
            int size = clientes.length;

            if (size == 0) {
              return const Text(
                'Sem dados para Carregar',
                textAlign: TextAlign.center,
              );
            }

            return ListView.builder(
              itemCount: clientes.length,
              itemBuilder: (BuildContext context, int index) {
                final curCliente = clientes[index];
                return TileCliente(cliente: curCliente);
              },
            );
          } else {
            return const Text('Carregando Dados');
          }
        },
      ),
    );
  }
}
