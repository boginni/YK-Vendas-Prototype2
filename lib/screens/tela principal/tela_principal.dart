import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaPrincipal extends ModdelScreen {
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Força de Vendas"),
      ),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Container(
        child: Column(
          children: [
            TileVisita(
              nome: 'Raimunda Hosana',
              apelido: 'Paraiso Bar',
            ),
            TileVisita(
              nome: 'Antonio Luca',
              apelido: 'Premium Convenciencia 1581',
            ),
            TileVisita(
              nome: 'Paula Wanessa',
              apelido: 'Paula Dep.de Bebibas 1581',
            ),
            TileVisita(
              nome: 'Francisco Waldemir',
              apelido: 'Mercantil Moura II 4172',
            ),
            TileVisita(
              nome: 'Welton Moreira',
              apelido: 'REST 1594',
            ),
            TileVisita(
              nome: 'Edinaldo Nascimento',
              apelido: 'Bar dp Edo',
            ),
          ],
        ),
      ),
    );
  }
}

class TileVisita extends StatelessWidget {
  const TileVisita({Key? key, this.nome, this.apelido}) : super(key: key);

  final apelido;
  final nome;
  static int curMap = 0;

  static Widget getMapIcon() {
    return Icon(
      ++curMap % 2 != 0
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

        onPressed: () {  },
        child: Column(
          children: [
            Row(
              children: [
                getMapIcon(),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(nome,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900])),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          apelido,
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
            // Divider(
            //   color: Colors.grey,
            // ),
          ],
        ),
      ),
    );
  }
}
