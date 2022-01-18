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
  bool operator ==(Object other) => other is DropDownSavedValue && other.id == id;

  @override
  int get hashCode => id.hashCode;

}

class DropDownSaved extends StatefulWidget {

  final String table;
  DropDownSavedValue? currentValue;

  DropDownSaved(this.table, {Key? key, this.currentValue}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DropDownSavedState();
}


class DropDownSavedState extends State<DropDownSaved> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Future<List<DropDownSavedValue>> getList() async{
      final Database db = await DatabaseLocal.getDatabase();

      final List<Map<String, dynamic>> maps = await db.query(widget.table);

      final list = List.generate(maps.length, (i) {
        final tp = DropDownSavedValue(maps[i]['ID']);
        tp.nome = maps[i]['NOME'];
        return tp;
      });

      return list;
    }

    update(final DropDownSavedValue? item){

      setState(() {
        widget.currentValue = item;
      });
    }

    return FutureBuilder(
      future: getList(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DropDownSavedValue>> snapshot) {
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
      },);
  }


}