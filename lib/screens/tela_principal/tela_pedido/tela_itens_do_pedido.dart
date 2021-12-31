import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/common/tiles/default_tiles.dart';

class TelaItensPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens do Pedido'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    child: Center(
                        child: Icon(
                      CupertinoIcons.left_chevron,
                      size: 32,
                    )),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Categoria',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Center(
                        child: Icon(
                      CupertinoIcons.right_chevron,
                      size: 32,
                    )),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 48,),
            TileButton(
              icon: CupertinoIcons.cube_box,
              title: 'AGUA MINERAL FLORATTA 10 LITROS',
              onPressMethod: () {
                Navigator.of(context).pushNamed('/telaItemPedido');
              },
            ),
            TileButton(
              icon: CupertinoIcons.cube_box,
              title: 'AGUA MINERAL FLORATTA 1500MLX6',
              onPressMethod: () {
                Navigator.of(context).pushNamed('/telaItemPedido');
              },
            ),
            TileButton(
              icon: CupertinoIcons.cube_box,
              title: 'AGUA MINERAL FLORATTA 350MLX24',
              onPressMethod: () {
                Navigator.of(context).pushNamed('/telaItemPedido');
              },
            ),
            TileButton(
              icon: CupertinoIcons.cube_box,
              title: 'AGUA MINERAL FLORATTA 5 LTS',
              onPressMethod: () {
                Navigator.of(context).pushNamed('/telaItemPedido');
              },
            ),
            TileButton(
              icon: CupertinoIcons.cube_box,
              title: 'AGUA MINERAL FLORATTA COPO 300MLX24',
              onPressMethod: () {
                Navigator.of(context).pushNamed('/telaItemPedido');
              },
            ),
          ],
        ),
      ),
    );
  }
}
