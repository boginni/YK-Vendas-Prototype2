import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:flutter/services.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:provider/provider.dart';

class TelaItemPedido extends StatelessWidget {
  static const routeName = '/telaItemPedido';

  const TelaItemPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    Produto argProduto = args[0] as Produto;
    Visita visita = args[1] as Visita;


    return Provider<ItemVisita>(
      create: (BuildContext context) {
        return ItemVisita();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View Produto'),
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

              context.read<ItemVisita>().produto = p;
              context.read<ItemVisita>().idVisita = visita.id;



              saveProduct() async {
                ItemVisita v = Provider.of<ItemVisita>(context, listen: false);

                // int x = v.quantidade;
                // int y = visita.idPessoa;
                await DatabaseLocal.insertItemVisita(v);

                Navigator.of(context).pop(context);

              }


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
                    TextButton(
                      onPressed: () => saveProduct(),
                      child: const Text(
                        "Salvar",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
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

    final Produto produto = context.read<ItemVisita>().produto;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          //
          const TileTopico('Categoria'),
          TileTextFlex('Grupo:', produto.grupo),
          TileTextFlex('Subgrupo:', produto.subGrupo),
          TileTextFlex('Departamento:', produto.departamento),
          //
          const TileTopico('Estoque'),
          TileTextFlex('Tipo de medida:', produto.unidade),
          const TileTextFlex('Estoque Atual:', '0.00'),
          const TileTextFlex('Quantidade Reservada:', '12.00'),
          //
          const TileTopico('Financeiro'),
          TileTextFlex('Preço:', _getPreco(produto)),
          TileTextFlex('Total Bruto:', _getTotal(produto)),
          TileTextFlex('Total Liquido:', _getTotal(produto)),
          TileTextFlex('Subtotal do Pedido:', _getTotal(produto)),
          //
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
                context.read<ItemVisita>().quantidade = x;
                setQtd(x);
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ]),
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
