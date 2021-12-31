import 'package:flutter/material.dart';
import 'package:loja_virtual/common/tiles/default_tiles.dart';

class TelaVisita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Visita'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/main');
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            TileButton(
              title: 'Chegada no cliente',
              icon: Icons.gps_fixed_sharp,
              onPressMethod: () {
                Navigator.of(context).pushNamed('/chegadaCliente');
              },
            ),
            TileButton(
              title: 'Pedido',
              icon: Icons.add_shopping_cart,
              onPressMethod: () {
                Navigator.of(context).pushNamed('/pedido');
              },
            ),
            TileButton(
              title: 'Visita Realizada',
              icon: Icons.note_outlined,
              onPressMethod: () {
                Navigator.of(context).pushNamed('/visitaRealizada');
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
