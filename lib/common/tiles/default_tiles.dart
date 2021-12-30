import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/database_objects/cliente.dart';
import 'package:loja_virtual/models/database_objects/visita.dart';

class TileButton extends StatelessWidget {
  const TileButton({Key? key, this.icon, this.title, this.onPressMethod})
      : super(key: key);

  final Function? onPressMethod;
  final IconData? icon;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          onPressMethod!();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
  const TileText({Key? key, this.title, this.value}) : super(key: key);

  final title;
  final value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed('/telaVisita');

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                        visita.endereco,
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
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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





