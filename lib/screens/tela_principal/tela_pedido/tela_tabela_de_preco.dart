import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_fields.dart';
import 'package:sqflite/sqflite.dart';

class TelaTabelaPreco extends StatefulWidget {
  static const routeName = '/telaTabelaPreco';

  const TelaTabelaPreco({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TelaTabelaPrecoState();
}

class TelaTabelaPrecoState extends State<TelaTabelaPreco> {
  DropDownSavedValue? tabela;

  void setTabela(DropDownSavedValue? x) async {
    setState(() {
      tabela = x;
    });
  }

  void saveTabela(final int idVisita) async {
    await insertTabelaPreco(idVisita, tabela!);
    Navigator.of(context).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final int idVisita = ModalRoute.of(context)!.settings.arguments as int;

    Future<int> setup() async {
      try {
        tabela = await getTabelaPreco(idVisita);
      } catch (e) {
        debugPrint(e.toString());

      }

      return 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabela de Preço'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Card(
        child: FutureBuilder(
          future: setup(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            if (snapshot.connectionState != ConnectionState.done) {
              return const Text('Carregando');
            }

            debugPrint(tabela.toString());

            return ListView(
              children: <Widget>[

                DropDownSaved(
                  DropDownSaved.tabelaPreco,
                  currentValue: tabela,
                  onChange: (i) => setTabela(i),
                ),


                TextButton(
                  onPressed: tabela != null ? () => saveTabela(idVisita) : null,
                  child: const Text(
                    "Salvar",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            );

            try {} catch (e) {
              debugPrint(e.toString());
              return Text(e.toString());
            }
          },
        ),
      ),
    );
  }
}

Future<DropDownSavedValue?> getTabelaPreco(int idVisita) async {
  final Database db = await DatabaseLocal.getDatabase();

  final List<Map<String, dynamic>> maps = await db
      .query('VW_VISITA', where: 'ID_VISITA = ?', whereArgs: [idVisita]);

  final list = List.generate(maps.length, (i) {
    final tp = DropDownSavedValue(maps[i]['ID_TABELA_PRECOS'], nome: maps[i]['NOME_TABELA']);
    return tp;
  });

  return list[0];
}

Future<void> insertTabelaPreco(
    final int idVisita, final DropDownSavedValue x) async {
  try {
    final db = await DatabaseLocal.getDatabase();
    await db.insert(
      'CP_VISITA_TABELA',
      {'ID_VISITA': idVisita, 'ID_TABELA_PRECOS': x.id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}
