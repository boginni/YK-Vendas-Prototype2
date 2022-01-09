import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita.dart';

class TileButton extends StatelessWidget {
  const TileButton({Key? key, this.icon, this.title = "", this.onPressMethod})
      : super(key: key);

  final Function? onPressMethod;
  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          onPressMethod!();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              Icon(
                icon,
                size: 48,
              ),
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

  static int countIcon = 0;

  static Widget getMapIcon() {
    return Icon(
      ++countIcon % 2 != 0
          ? CupertinoIcons.doc_text
          : CupertinoIcons.doc_text_fill,
      size: 64,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Navigator.of(context)
              .pushNamed(TelaVisita.routeName, arguments: visita);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              getMapIcon(),
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

  static Widget getIcon() {
    return Icon(
      ++countIcon % 2 != 0
          ? CupertinoIcons.doc_text
          : CupertinoIcons.doc_text_fill,
      size: 48,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              getIcon(),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(cliente.nomeFantasia,
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
        Navigator.of(context).pushNamed('/telaNovoProduto');
      },
    );
  }
}
