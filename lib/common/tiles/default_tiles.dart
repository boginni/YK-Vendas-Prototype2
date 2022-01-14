import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/miscellaneous/custom_widgets.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/models/page_manager.dart';
import 'package:forca_de_vendas/screens/produtos/tela_novo_produto.dart';
import 'package:forca_de_vendas/screens/produtos/tela_view_produto.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita.dart';
import 'package:provider/provider.dart';

class TileButton extends StatelessWidget {
  const TileButton({Key? key, this.icon, this.title = "", this.onPressMethod})
      : super(key: key);

  final Function? onPressMethod;
  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: TextButton(
        // color: Colors.white,
        onPressed: () {
          onPressMethod!();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Row(
            children: [
              IconTheme(
                  data: Theme.of(context).primaryIconTheme,
                  child: Icon(
                    icon,
                    size: 48,
                  )),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileText extends StatelessWidget {
  const TileText({Key? key, this.title = "", this.value = ""})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900])),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(value,
                  style: TextStyle(fontSize: 18, color: Colors.grey[500])),
            ),
          ],
        ),
      ),
    );
  }
}

class TileVisita extends StatelessWidget {
  final Visita visita;

  const TileVisita({Key? key, required this.visita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(TelaVisita.routeName, arguments: visita);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              const IconDynamic(
                primary: CupertinoIcons.doc_text,
                secondary: CupertinoIcons.doc_text_fill,
                size: 64,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(visita.apelido,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900])),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        visita.nome,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        visita.getEndereco(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileCliente extends StatelessWidget {
  // final Function? onPressMethod;

  final Cliente cliente;

  static int countIcon = 0;

  const TileCliente({Key? key, required this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              const IconDynamic(
                primary: CupertinoIcons.person_fill,
                secondary: CupertinoIcons.person,
                size: 48,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(cliente.apelido,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileProduto extends StatelessWidget {
  final Produto produto;

  const TileProduto({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TileButton(
      icon: CupertinoIcons.cube_box,
      title: produto.nome,
      onPressMethod: () {
        Navigator.of(context)
            .pushNamed(TelaViewProduto.routeName, arguments: produto);
      },
    );
  }
}

class TileRota extends StatelessWidget {
  const TileRota(this.rota, this.onPressMethod, {Key? key}) : super(key: key);
  final Rota rota;
  final Function onPressMethod;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextButton(
        onPressed: () => onPressMethod(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const IconDynamic(
                    primary: CupertinoIcons.map,
                    secondary: CupertinoIcons.map_fill,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Text(
                      rota.nome,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan),
                    ),
                  ),
                ],
              ),
              // const Divider(
              //   color: Colors.grey,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileGraph extends StatelessWidget {
  const TileGraph(this.graph, {Key? key}) : super(key: key);

  final Graph graph;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    const icon = IconDynamic(
      primary: CupertinoIcons.graph_circle,
      secondary: CupertinoIcons.graph_circle_fill,
      size: 24,
    );

    onClick() {
      debugPrint('test');
    }

    return TilePlain(
      icon: icon,
      name: graph.nome,
      onClickFunction: onClick,
    );
  }
}

class TilePlain extends StatelessWidget {
  const TilePlain({
    Key? key,
    required this.icon,
    required this.name,
    required this.onClickFunction,
  }) : super(key: key);

  final IconDynamic icon;
  final String name;
  final Function onClickFunction;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextButton(
        onPressed: () => onClickFunction,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  icon,
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan),
                    ),
                  ),
                ],
              ),
              // const Divider(
              //   color: Colors.grey,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileTopico extends StatelessWidget {
  final String name;

  const TileTopico(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Row(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}

class TileTextFlex extends StatelessWidget {
  const TileTextFlex(this.title, this.value, {Key? key}) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          value,
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
        )
      ],
    );
  }
}
