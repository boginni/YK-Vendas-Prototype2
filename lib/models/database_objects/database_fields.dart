import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../database_local.dart';

class DropdownSavedValue {
  final int id;
  late final String? nome;

  DropdownSavedValue(this.id, {this.nome});

  @override
  String toString() {
    return "$id -> $nome";
  }

  @override
  bool operator ==(Object other) =>
      other is DropdownSavedValue && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class Dropdownsaved extends StatefulWidget {
  static const String tabelaPreco = 'VW_TABELA_PRECO';
  static const String formaPagamento = 'VW_FORMA_PAGAMENTO';

  final String table;
  DropdownSavedValue? currentValue;
  Function(DropdownSavedValue? item) onChange;

  Dropdownsaved(this.table, {Key? key, this.currentValue, required this.onChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => DropdownsavedState();
}

class DropdownsavedState extends State<Dropdownsaved> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Future<List<DropdownSavedValue>> getList() async {
      List<DropdownSavedValue> list = [];
      try {



        final List<Map<String, dynamic>> maps = await DatabaseLocal.query(widget.table, '', []);;

        list = List.generate(maps.length, (i) {
          final tp = DropdownSavedValue(maps[i]['ID'], nome: maps[i]['NOME']);
          return tp;
        });
      } catch (e) {
        debugPrint(e.toString());
      }

      return list;
    }

    update(final DropdownSavedValue? item) {
      setState(() {
        widget.currentValue = item;
      });

      widget.onChange(item);
    }

    return FutureBuilder(
      future: getList(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DropdownSavedValue>> snapshot) {
        if (!snapshot.hasData) {
          return const Text('Carregando');
        }

        final list = snapshot.data!;

        return DropdownButton<DropdownSavedValue>(
          value: widget.currentValue,
          items: list.map((DropdownSavedValue item) {
            return DropdownMenuItem<DropdownSavedValue>(
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
