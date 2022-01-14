import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_dados_da_entrega.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_itens_do_pedido.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_tabela_de_preco.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_totais_do_pedido.dart';

class TelaPedido extends StatelessWidget {

  static const routeName = '/pedido';

  const TelaPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    Visita visita = ModalRoute.of(context)!.settings.arguments as Visita;

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
              Navigator.of(context).pushNamed(TelaTabelaPreco.routeName);
            },
          ),
          TileButton(
            title: 'Itens do pedido',
            icon: Icons.shopping_cart,
            onPressMethod: () {
               Navigator.of(context).pushNamed(TelaItensPedido.routeName, arguments: visita);
            },
          ),
          TileButton(
            title: 'Dados da Entrega',
            icon: Icons.local_shipping,
            onPressMethod: () {
              Navigator.of(context).pushNamed(TelaDadosEntrega.routeName);
            },
          ),
          TileButton(
            title: 'Totais do Pedido',
            icon: Icons.monetization_on_outlined,
            onPressMethod: () {
              Navigator.of(context).pushNamed(TelaTotaisPedido.routeName, arguments: visita);
            },
          ),
        ],
      ),
    );
  }
}
