import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:sqflite/sqflite.dart';

/*

var _valores = ['valor', 'valor2', 'valor3'...];
DropDownButton<String>(

             items : _valores.map((String dropDownStringItem) {

              return DropdownMenuItem<String>(
                   value : dropDownStringItem,
                   child : Text(dropDownStringItem),
            );
           }).toList(),

           onChanged: () {
                setState( ()  {  //...seu codigo      });
           },
);

 */

class TabelaPreco {
  String nome = '';
  final int id;

  TabelaPreco(this.id);

  @override
  String toString() {
    return "$id -> $nome";
  }

  @override
  bool operator ==(Object other) => other is TabelaPreco && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class TelaTabelaPreco extends StatefulWidget {
  static const routeName = '/telaTabelaPreco';

  const TelaTabelaPreco({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TelaTabelaPrecoState();
}

class TelaTabelaPrecoState extends State<TelaTabelaPreco> {


  TabelaPreco? tabela;

  void setTabela(TabelaPreco? x) async {
    setState(() {
      tabela = x;
    });
  }

  void saveTabela(final int idVisita) async {
    await insertTabelaPreco(idVisita, tabela!);
    Navigator.of(context).pop(context);
  }


  Future<List<TabelaPreco>> setup(final idVisita) async{
    final list = await getListTabelaPreco();
    try{
      tabela = await getTabelaPreco(idVisita);
    } catch (e){

    }
    return list;
  }
  
  
  @override
  Widget build(BuildContext context) {
    final int idVisita = ModalRoute.of(context)!.settings.arguments as int;

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
          future: setup(idVisita),
          builder: (BuildContext context,
              AsyncSnapshot<List<TabelaPreco>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final list = snapshot.data!;

            return ListView(
              children: <Widget>[


                DropdownButton<TabelaPreco>(
                  value: tabela,
                  items: list.map((TabelaPreco item) {
                    return DropdownMenuItem<TabelaPreco>(
                      value: item,
                      child: Text(item.toString()),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setTabela(item);
                  },
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
          },
        ),
      ),
    );
  }
}

Future<List<TabelaPreco>> getListTabelaPreco() async {
  final Database db = await DatabaseLocal.getDatabase();

  final List<Map<String, dynamic>> maps = await db.query('VW_TABELA_PRECO');

  final list = List.generate(maps.length, (i) {
    final tp = TabelaPreco(maps[i]['ID']);
    tp.nome = maps[i]['NOME'];
    return tp;
  });

  return list;
}


Future<TabelaPreco?> getTabelaPreco(int idVisita) async {
  final Database db = await DatabaseLocal.getDatabase();

  //NOME_TABELA
  //ID_TABELA_PRECOS
  final List<Map<String, dynamic>> maps = await db.query('VW_VISITA', where: 'ID_VISITA = ?', whereArgs: [idVisita]);

  final list = List.generate(maps.length, (i) {
    final tp = TabelaPreco(maps[i]['ID_TABELA_PRECOS']);
    tp.nome = maps[i]['NOME_TABELA'];
    return tp;
  });

  return list[0];
}

Future<void> insertTabelaPreco(final int idVisita, final TabelaPreco x) async {
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



