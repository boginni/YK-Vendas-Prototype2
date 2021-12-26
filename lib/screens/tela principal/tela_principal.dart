import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaPrincipal extends ModdelScreen {
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Força de Vendas"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (){},
              child: Icon(
                Icons.search,
                size: 26.0
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (){},
              child: Icon(
                  Icons.sync,
                  size: 26.0
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[50],
      drawer: CustomDrawer(),
      body: Container(
        child: Column(
          children: const [
            TileVisita(
              nome: 'Raimunda Hosana',
              apelido: 'Paraiso Bar',
              endereco: 'CAPITAO BARRISI, 448 - MILAGRE - CASTANHAL - 68740-001',
            ),
            TileVisita(
              nome: 'Antonio Luca',
              apelido: 'Premium Convenciencia 1581',
              endereco: 'CAPITAO BARRISI, 448 - MILAGRE - CASTANHAL - 68740-001',
            ),
            TileVisita(
              nome: 'Paula Wanessa',
              apelido: 'Paula Dep.de Bebibas 1581',
              endereco: 'RUA ALENCAR, 214 - MULTIRAO - Santa Maria do Para - 68738-000',
            ),
            TileVisita(
              nome: 'Francisco Waldemir',
              apelido: 'Mercantil Moura II 4172',
              endereco: 'ROD CASTCURUCA KM - KM 42 - Curuça - 68750-000',
            ),
            TileVisita(
              nome: 'Welton Moreira',
              apelido: 'REST 1594',
              endereco: 'Endereço',
            ),
            TileVisita(
              nome: 'Edinaldo Nascimento',
              apelido: 'Bar dp Edo',
              endereco: 'Endereço',
            ),
          ],
        ),
      ),
    );
  }
}

class TileVisita extends StatelessWidget {
  const TileVisita({Key? key, this.nome, this.apelido,this.endereco}) : super(key: key);

  final apelido;
  final nome;
  final endereco;
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
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/telaVisita');

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
                      child: Text(apelido,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900])),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        nome,
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
                        endereco,
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
