import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../database_local.dart';

class DropDownSavedValue {
  final int id;
  late final String? nome;

  DropDownSavedValue(this.id, {this.nome});

  @override
  String toString() {
    return "$id -> $nome";
  }

  @override
  bool operator ==(Object other) =>
      other is DropDownSavedValue && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class DropDownSaved extends StatefulWidget {
  static const String tabelaPreco = 'VW_TABELA_PRECO';

  final String table;
  DropDownSavedValue? currentValue;
  Function(DropDownSavedValue? item)? onChange;

  DropDownSaved(this.table, {Key? key, this.currentValue, this.onChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DropDownSavedState();
}

class DropDownSavedState extends State<DropDownSaved> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Future<List<DropDownSavedValue>> getList() async {
      List<DropDownSavedValue> list = [];
      try {
        final Database db = await DatabaseLocal.getDatabase();

        final List<Map<String, dynamic>> maps = await db.query(widget.table);

        list = List.generate(maps.length, (i) {
          final tp = DropDownSavedValue(maps[i]['ID'], nome: maps[i]['NOME']);
          return tp;
        });
      } catch (e) {
        debugPrint(e.toString());
      }

      return list;
    }

    update(final DropDownSavedValue? item) {
      setState(() {
        widget.currentValue = item;
      });

      widget.onChange!(item);


    }

    return FutureBuilder(
      future: getList(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DropDownSavedValue>> snapshot) {
        if (!snapshot.hasData) {
          return const Text('Carregando');
        }

        final list = snapshot.data!;

        return DropdownButton<DropDownSavedValue>(
          value: widget.currentValue,
          items: list.map((DropDownSavedValue item) {
            return DropdownMenuItem<DropDownSavedValue>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          onChanged: (item) {
            update(item);
          },
        );
      },
    );
  }
}
