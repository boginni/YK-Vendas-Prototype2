import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/chegada_cliente.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/tela_pedido.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/tela_visita_realizada.dart';
import 'package:provider/provider.dart';

class TelaVisita extends StatelessWidget {
  static const routeName = '/telaVisita';

  const TelaVisita({Key? key}) : super(key: key);

  // const TelaVisita();/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Visita visita = ModalRoute.of(context)!.settings.arguments as Visita;

    return Provider<Visita>(
      create: (BuildContext context) {
        return visita;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(visita.nome),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            TileButton(
              title: 'Chegada no cliente',
              icon: Icons.gps_fixed_sharp,
              onPressMethod: () {
                Navigator.of(context).pushNamed(TelaChegadaCliente.routeName);
              },
            ),
            TileButton(
              title: 'Pedido',
              icon: Icons.add_shopping_cart,
              onPressMethod: () {
                Navigator.of(context).pushNamed(TelaPedido.routeName);
              },
            ),
            TileButton(
              title: 'Visita Realizada',
              icon: Icons.note_outlined,
              onPressMethod: () {
                Navigator.of(context).pushNamed(TelaVisitaRealizada.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
