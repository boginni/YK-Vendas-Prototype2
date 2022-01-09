import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/form_field/formulario.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:sqflite/sqflite.dart';

class TelaNovoProduto extends StatelessWidget {
  // const TelaNovoProduto();

  static const routeName = '/telaNovoProduto';

  const TelaNovoProduto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Produto produto = Produto();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Produto'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Card(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              FormText(
                  title: "ID",
                  saveFunction: (text) {
                    produto.id = int.parse(text.toString());
                  }),
              FormText(
                  title: "Nome",
                  saveFunction: (text) {
                    produto.nome = text;
                  }),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // print("Campos Validados");

                    formKey.currentState!.save();

                    onSuccess() {
                      Navigator.of(context).pop(context);
                    }

                    onFail() {
                      debugPrint('Não implementado');
                    }

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
    );
  }
}

Future<void> insertProduto(Produto x, onSuccess, onFail) async {
  try {
    final db = await DatabaseLocal.getDatabase();

    await db.insert(
      'produtos',
      x.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    onSuccess();
  } catch (e) {
    onFail();
  }
}
