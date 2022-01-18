import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:intl/intl.dart';

class TelaChegadaCliente extends StatelessWidget {
  static const routeName = '/chegadaCliente';

  const TelaChegadaCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visita = ModalRoute.of(context)!.settings.arguments as Visita;

    final x = ChegadaCliente(visita.id);

    saveVisita() async {
      await DatabaseLocal.insertChegadaCliente(x);

      Navigator.of(context).pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chegada no Cliente'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Card(
        child: ListView(
          children: <Widget>[
            TileText(
              title: 'Data',
              value: DateFormat('dd/MM/yyyy').format(x.chegada),
            ),

            TileText(
              title: 'Hora',
              value: DateFormat('Hm').format(x.chegada),
            ),

            const Text('Resumo Financeiro do Cliente'),

            TileText(
              title: 'Títulos a Vencer',
              value: x.titulosVencer.toString(),
            ),

            TileText(
              title: 'Limite de Credito',
              value: x.limiteCredito.toString(),
            ),

            // TileText(
            //   title: 'Informações da Última visita',
            //   value: x.statusUltimaVisita,
            // ),

            TextButton(
              onPressed: saveVisita,
              child: const Text(
                "Salvar",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
