import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaGraficos extends ModdelScreen {
  const TelaGraficos({Key? key}) : super(key: key);

  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const  Text('Gráficos')),
        drawer: const CustomDrawer(),
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: ListView(
            children: const <Widget>[
              TileGraph(
                nome: 'Cerv 1/1',
              ),
              TileGraph(
                nome: 'Quantidade e Total Liquido R\$ Por itens : Descrição',
              ),
              TileGraph(
                nome:
                    'Quantidade Meta e Meta alcançada Por Outros Cadastros : Descrição',
              ),
              TileGraph(
                nome: 'Valor Venda e Valor comisssão',
              ),
            ],
          ),
        ));
  }
}

class TileGraph extends StatelessWidget {
  const TileGraph({Key? key, this.nome = ""}) : super(key: key);

  final String nome;
  static int curMap = 0;

  static Widget getMapIcon() {
    return Icon(
        ++curMap % 2 != 0
            ? CupertinoIcons.graph_circle
            : CupertinoIcons.graph_circle_fill,
        size: 32);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            getMapIcon(),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                nome,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
