import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_adicionar_item.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_dados_da_entrega.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_tabela_de_preco.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_totais_do_pedido.dart';

class TelaPedido extends StatefulWidget {
  static const routeName = '/pedido';

  const TelaPedido({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TelaPedidoState();
}

class TelaPedidoState extends State {
  @override
  Widget build(BuildContext context) {

    final int idVisita = ModalRoute.of(context)!.settings.arguments as int;

    void update() {
      setState(() {});
    }

    clickTabelaPreco() async {
      await Navigator.of(context)
          .pushNamed(TelaTabelaPreco.routeName, arguments: idVisita)
          .then((value) => update());
    }

    return FutureBuilder(
      future: BufferTranslator.getVisita(idVisita),
      builder: (BuildContext context, AsyncSnapshot<Visita> snapshot) {
        Widget child = const Center(
          child: CircularProgressIndicator(),
        );

        Visita visita = Visita();

        if (snapshot.hasData) {
          visita = snapshot.data!;

          child = ListView(
            children: [
              TileButton(
                title: 'Tabela de Preço',
                icon: Icons.list_alt,
                onPressMethod: clickTabelaPreco,
              ),
              TileButton(
                title: 'Itens do pedido',
                icon: Icons.shopping_cart,
                onPressMethod: () {
                  Navigator.of(context).pushNamed(TelaAdicionarItem.routeName,
                      arguments: idVisita);
                },
                isActive: visita.tabelaConcluida,
              ),
              TileButton(
                title: 'Dados da Entrega',
                icon: Icons.local_shipping,
                onPressMethod: () {
                  Navigator.of(context).pushNamed(TelaDadosEntrega.routeName,
                      arguments: idVisita);
                },
              ),
              TileButton(
                title: 'Totais do Pedido',
                icon: Icons.monetization_on_outlined,
                onPressMethod: () {
                  Navigator.of(context).pushNamed(TelaTotaisPedido.routeName,
                      arguments: idVisita);
                },
              ),
            ],
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Pedido"),
            centerTitle: true,
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
          ),
          body: child,
        );
      },
    );
  }
}
