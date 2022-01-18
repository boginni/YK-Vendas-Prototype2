import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:sqflite/sqflite.dart';

class TelaDadosEntrega extends StatelessWidget {

  static const routeName = '/TelaDadosEntrega';

  const TelaDadosEntrega({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final int idVisita = ModalRoute.of(context)!.settings.arguments as int;

    final dados = DadosEntrega(idVisita);

    saveDadosEntrega() async{

      await insertDadosEntrega(dados);

      Navigator.of(context).pop(context);

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados da Entrega'),
        leading: BackButton(
          onPressed: () =>
              Navigator.of(context).pop(context),
        ),
      ),
      body: Card(
        child: ListView(
          children:  <Widget>[
            const TileText(title: 'Data',value: 'Not Implemented',),

            TextFormField(
              initialValue: dados.getData(),
            ),

            const TileText(title: 'Restrição de Horário',value: 'Not Implemented',),
            const TileText(title: 'Observações',value: 'Not Implemented',),

            TextButton(
              onPressed:  true ? () => saveDadosEntrega() : null,
              child: const Text(
                "Salvar",
                style: TextStyle(color: Colors.black),
              ),
            )

          ],
        ),


      ),
    );
  }
}


class DadosEntrega{
  final int idVisita;

  DadosEntrega(this.idVisita);

  String getData() => DatabaseLocal.getCurrentTime();

}


Future<void> insertDadosEntrega(final DadosEntrega x) async {
  final int idVisita = x.idVisita;

  try {
    final db = await DatabaseLocal.getDatabase();
    await db.insert(
      'CP_VISITA_ENTREGA',
      {'ID_VISITA': idVisita, 'DATA': x.getData()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  } catch (e) {
    debugPrint(e.toString());
  }
}

// CP_VISITA_ENTREGA
// ID_VISITA
// DATA


