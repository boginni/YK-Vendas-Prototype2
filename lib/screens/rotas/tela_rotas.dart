import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaRotas extends ModdelScreen {
  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo Cliente'),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: const <Widget>[
              RotaTile(
                nome: 'ROTA FLORATA',
              ),
              RotaTile(
                nome: 'JOELSON',
              ),
              RotaTile(
                nome: 'TERCA-FEIRA 204',
              ),
              RotaTile(
                nome: 'Rota Elton',
              ),
              RotaTile(
                nome: 'INATIVO',
              ),
              RotaTile(
                nome: 'QUARTA-FEIRA 201',
              ),
              RotaTile(
                nome: 'TERCA-FEIRA 205',
              ),
              RotaTile(
                nome: 'TERCA-FEIRA 201',
              ),
              RotaTile(
                nome: 'ROTA HUMBERTO',
              ),
            ],
          ),
        ));
  }
}

class RotaTile extends StatelessWidget {
  const RotaTile({Key? key, this.nome}) : super(key: key);

  final nome;
  static int curMap = 0;

  static Widget getMapIcon() {
    return Icon(
      ++curMap % 2 != 0 ? CupertinoIcons.map : CupertinoIcons.map_fill,
      size: 32,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            getMapIcon(),
            SizedBox(
              width: 12,
            ),
            Flexible(
              child: Text(
                nome,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
