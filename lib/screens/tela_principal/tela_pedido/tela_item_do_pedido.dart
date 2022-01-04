import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';


class TelaItemPedido extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Item do Pedido'),
       leading: BackButton(
         onPressed: (){
           Navigator.of(context).pop();
         },
       ),
     ),
     body: Container(
       child: Card(
         child: ListView(
           children: [
             Text('CATEGORIA DO PRODUTO'),
             TileButton(icon: CupertinoIcons.cube_box, title: 'NOME DO PRODUTO',),
             Divider(),
             TileText(title: 'Imagem',value: 'Not Implemented',),
             Divider(),
             TileText(title: 'Quantidade',value: 'Not Implemented',),
             Divider(),
             TileText(title: 'Preço R\$',value: 'Not Implemented',),
             TileText(title: 'Total Bruto R\$',value: 'Not Implemented',),
             TileText(title: 'Total Liquido R\$',value: 'Not Implemented',),
             TileText(title: 'Subtotal do Pedido R\$',value: 'Not Implemented',),


           ],


         ),
       ),
     ),

   );
  }

}