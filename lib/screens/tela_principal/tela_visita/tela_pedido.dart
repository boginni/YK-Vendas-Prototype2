import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaPedido extends StatelessWidget {

  // const TelaPedido();
  static const routeName = '/pedido';

  const TelaPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedido'),
        leading: BackButton(
          onPressed: () =>
              Navigator.of(context).pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          TileButton(
            title: 'Tabela de Preço',
            icon: Icons.list_alt,
            onPressMethod: () {
              Navigator.of(context).pushNamed('/telaTabelaPreco');
            },
          ),
          TileButton(
            title: 'Itens do pedido',
            icon: Icons.shopping_cart,
            onPressMethod: () {
              Navigator.of(context).pushNamed('/telaItensPedido');
            },
          ),
          TileButton(
            title: 'Dados da Entrega',
            icon: Icons.local_shipping,
            onPressMethod: () {
              Navigator.of(context).pushNamed('/telaDadosEntrega');
            },
          ),
          TileButton(
            title: 'Totais do Pedido',
            icon: Icons.monetization_on_outlined,
            onPressMethod: () {
              Navigator.of(context).pushNamed('/telaTotaisPedido');
            },
          ),
        ],
      ),
    );
  }
}
