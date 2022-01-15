import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:flutter/services.dart';
import 'package:forca_de_vendas/models/database_local.dart';

class TelaItemPedido extends StatelessWidget {
  static const routeName = '/telaItemPedido';

  const TelaItemPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    int idVisita = args[0] as int;
    int idProduto = args[1] as int;

    final item = ItemVisita();

    item.idVisita = idVisita;

    bool onLoading = true;

    saveProduct() async {
      if (onLoading) return;

      await DatabaseLocal.insertItemVisita(item);

      Navigator.of(context).pop(context);
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text('View Produto'),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              onPressed: saveProduct,
              child: const Icon(CupertinoIcons.add_circled_solid),
            )
          ]),
      body: FutureBuilder(
        future: BufferTranslator.getProdutoDet(idVisita, idProduto),
        builder: (BuildContext context, AsyncSnapshot<Produto> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            onLoading = false;

            Produto p = snapshot.data as Produto;

            item.produto = p;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListView(
                children: <Widget>[
                  Container(
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Center(
                          child: Icon(CupertinoIcons.cube_box, size: 186),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Text(
                            p.nome,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _ProductInfo(item),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class _ProductInfo extends StatefulWidget {
  const _ProductInfo(this.item, {Key? key}) : super(key: key);

  final ItemVisita item;

  @override
  State<StatefulWidget> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<_ProductInfo> {
  void setQtd(int x) {
    setState(() {
      widget.item.quantidade = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //
          const TileTopico('Categoria'),
          TileTextFlex('Grupo:', widget.item.produto.grupo),
          TileTextFlex('Subgrupo:', widget.item.produto.subGrupo),
          TileTextFlex('Departamento:', widget.item.produto.departamento),
          //
          const TileTopico('Estoque'),
          TileTextFlex('Tipo de medida:', widget.item.produto.unidade),
          const TileTextFlex('Estoque Atual:', '0.00'),
          const TileTextFlex('Quantidade Reservada:', '12.00'),
          //
          const TileTopico('Financeiro'),
          TileTextFlex('Preço:', _getPreco()),
          TileTextFlex('Total Bruto:', _getTotalFormat()),
          TileTextFlex('Total Liquido:', _getTotalFormat()),
          TileTextFlex('Subtotal do Pedido:', _getSubTotal()),
          //
          const Text(
            'Quantidade',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
            ),
            style: const TextStyle(fontSize: 22),
            onChanged: (text) {
              int x = int.parse(text.isEmpty ? '0' : text);
              setQtd(x);
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            initialValue: widget.item.quantidade == 0
                ? ''
                : widget.item.quantidade.toString(),
          ),
        ],
      ),
    );
  }

  String _getPreco() {
    String moeda = 'R\$';

    double calc = widget.item.produto.preco;

    return "$moeda: $calc";
  }

  String _getTotalFormat() {
    String moeda = 'R\$';

    double calc = _getTotal();

    return "$moeda: $calc";
  }

  double _getTotal() {
    return widget.item.quantidade * widget.item.produto.preco;
  }

  String _getSubTotal() {
    String moeda = 'R\$';

    double calc = _getTotal() + widget.item.produto.total;

    return "$moeda: $calc";
  }
}
