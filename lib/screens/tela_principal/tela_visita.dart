import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/chegada_cliente.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/tela_pedido.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/tela_visita_realizada.dart';
import 'package:provider/provider.dart';

class TelaVisita extends StatefulWidget {
  static const routeName = '/telaVisita';

  const TelaVisita({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TelaVisitaState();
}

class TelaVisitaState extends State<TelaVisita> {

  void update() async{
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    int idVisita = ModalRoute.of(context)!.settings.arguments as int;

    clickChegada(Visita visita) async {
      await Navigator.of(context)
          .pushNamed(TelaChegadaCliente.routeName, arguments: visita)
          .then((value) => update());
    }

    return FutureBuilder(
      future: BufferTranslator.getVisita(idVisita),
      builder: (BuildContext context, AsyncSnapshot<Visita> snapshot) {
        Widget child = const Center(
          child: CircularProgressIndicator(),
        );

        Visita visita = Visita();

        if (snapshot.hasData) {
          visita = snapshot.data!;

          child = ListView(
            children: [
              TileButton(
                title: 'Chegada no cliente',
                icon: Icons.gps_fixed_sharp,
                onPressMethod: () => clickChegada(visita),
                isActive: !visita.chegadaConcluida,
              ),
              TileButton(
                title: 'Pedido',
                icon: Icons.add_shopping_cart,
                onPressMethod: () {
                  Navigator.of(context)
                      .pushNamed(TelaPedido.routeName, arguments: idVisita);
                },
                isActive: visita.chegadaConcluida,
              ),
              TileButton(
                title: 'Visita Realizada',
                icon: Icons.note_outlined,
                onPressMethod: () {
                  Navigator.of(context)
                      .pushNamed(TelaVisitaRealizada.routeName);
                },
              ),
            ],
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(visita.nome), //TODO Mudar para visita
            centerTitle: true,
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
          ),
          body: child,
        );
      },
    );
  }
}
