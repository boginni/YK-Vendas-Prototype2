import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';

class TelaItemPedido extends StatelessWidget {


  static const routeName = '/telaItemPedido';

  const TelaItemPedido({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    Produto curProduto = ModalRoute.of(context)!.settings.arguments as Produto;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item do Pedido'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Card(
        child: ListView(
          children: <Widget>[
            const Text('CATEGORIA DO PRODUTO'),
            TileButton(
              icon: CupertinoIcons.cube_box,
              title: curProduto.nome,
            ),
            const Divider(),
            const TileText(
              title: 'Imagem',
              value: 'Not Implemented',
            ),
            const Divider(),
            const TileText(
              title: 'Quantidade',
              value: 'Not Implemented',
            ),
            const Divider(),
            const TileText(
              title: 'Preço R\$',
              value: 'Not Implemented',
            ),
            const TileText(
              title: 'Total Bruto R\$',
              value: 'Not Implemented',
            ),
            const TileText(
              title: 'Total Liquido R\$',
              value: 'Not Implemented',
            ),
            const TileText(
              title: 'Subtotal do Pedido R\$',
              value: 'Not Implemented',
            ),
          ],
        ),
      ),
    );
  }
}

enum MyEnum { a, b }

class ClassA {
  final MyEnum myEnum;

  const ClassA({this.myEnum = MyEnum.a});
}

class ClassB {
  final ClassA classA;

  ClassB(
      {this.classA =
          const ClassA()}); // ClassA expression is underlined with red

}
