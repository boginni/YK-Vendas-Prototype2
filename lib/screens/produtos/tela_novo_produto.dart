import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/form_field/formulario.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:sqflite/sqflite.dart';

class TelaNovoProduto extends StatelessWidget {
  final Produto produto = Produto();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Produto'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Container(
        child: Card(
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                FormText(
                    title: "ID",
                    saveFunction: (text) {
                      produto.id = text;
                    }),
                FormText(
                    title: "Nome",
                    saveFunction: (text) {
                      produto.nome = text;
                    }),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate())  {
                      // print("Campos Validados");

                      onSuccess(){
                        print('Inserido');
                        Navigator.of(context).pop(context);
                      };


                      onFail(){
                        print('Erro');
                      };

                      await insertProduto(produto, onSuccess, onFail);
                    }
                  },
                  child: const Text(
                    "Adicionar",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> insertProduto(Produto x, onSuccess, onFail) async {
  try{
    final db = await DatabaseLocal.getDatabase();

    await db.insert(
      'produtos',
      x.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    onSuccess();
  } catch (e){
    onFail();
  }
}
