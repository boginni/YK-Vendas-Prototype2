import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:provider/provider.dart';

class CounterProduto {
  int counter = 0;

  Produto produto = Produto();
}

class TelaViewProduto extends StatelessWidget {
  static const routeName = '/telaViewProduto';

  const TelaViewProduto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Produto argProduto = ModalRoute.of(context)!.settings.arguments as Produto;

    return FutureProvider<CounterProduto>(
      create: (BuildContext context) {
        (_) => CounterProduto();
      },
      initialData: CounterProduto(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View produto'),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: FutureBuilder(
          future: BufferTranslator.getProdutoDet(argProduto.id),
          builder: (BuildContext context, AsyncSnapshot<Produto> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Produto p = snapshot.data as Produto;

              context.read<CounterProduto>().produto = p;

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
                    const _ProductInfo(),
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: TextButton(
          onPressed: () {
            int x = context
                .read<CounterProduto>()
                .counter; //Navigator.of(context).pop(context)

            debugPrint("produtos: " + x.toString());
          },
          child: const Text(
            "Salvar",
            style: TextStyle(color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}

class _ProductInfoState extends State {
  int qtd = 0;

  void setQtd(int x) {
    setState(() {
      qtd = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final Produto produto = context.read<CounterProduto>().produto;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Quantidade',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(fontSize: 22),
              onChanged: (text) {
                int x = int.parse(text.isEmpty ? '0' : text);
                context.read<CounterProduto>().counter = x;
                setQtd(x);
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ]),
          //
          const TileTopico('Categoria'),
          TileTextFlex('Grupo:', produto.grupo),
          TileTextFlex('Subgrupo:', produto.subGrupo),
          TileTextFlex('Departamento:', produto.departamento),
          //
          const TileTopico('Estoque'),
          TileTextFlex('Tipo de medida:', produto.unidade),
          TileTextFlex('Estoque Atual:', '0.00'),
          TileTextFlex('Quantidade Reservada:', '12.00'),
          //
          const TileTopico('Financeiro'),
          TileTextFlex('Preço:', _getPreco(produto)),
          TileTextFlex('Total Bruto:', _getTotal(produto)),
          TileTextFlex('Total Liquido:', _getTotal(produto)),
          TileTextFlex('Subtotal do Pedido:', _getTotal(produto)),
        ],
      ),
    );
  }

  String _getPreco(Produto p) {
    String moeda = 'R\$';

    double calc = p.preco;

    return "$moeda: $calc";
  }

  String _getTotal(Produto p) {
    String moeda = 'R\$';

    double calc = qtd * p.preco;

    return "$moeda: $calc";
  }
}

class _ProductInfo extends StatefulWidget {
  const _ProductInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductInfoState();
}
