import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_objects/database_objects.dart';

class DatabaseLocal {
  static const int version = 2;

  static Future<Database> getDatabase() async {
    // print(await getDatabasesPath());

    return await openDatabase(
      join(await getDatabasesPath(), 'banco.db'),
      version: version,
    );
  }

  Future<void> insertCliente(Cliente x) async {
    final db = await DatabaseLocal.getDatabase();

    await db.insert(
      'CB_PESSOA',
      {'ID': x.id, 'NOME': x.nomeFantasia},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  static Future<void> insertProduto(Produto x, onSuccess, onFail) async {
    try {
      final db = await getDatabase();
      await db.insert(
        'CP_PRODUTO',
        x.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      onSuccess();
    } catch (e) {
      onFail();
    }
  }


}

class BufferTranslator {
  static Future<List<Visita>> getVisitas() async {
    final db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('VW_VISITA');

    final visitas = List.generate(maps.length, (i) {
      Visita v = Visita();

      v.idPessoa = maps[i]['ID_PESSOA'];
      v.nome = maps[i]['NOME'];
      v.logradouro = maps[i]['LOGRADOURO'];
      v.numero = maps[i]['NUMERO'];
      v.cep = maps[i]['CEP'];
      v.bairro = maps[i]['BAIRRO'];
      v.cidade = maps[i]['CIDADE'];
      v.uf = maps[i]['UF'];
      v.estado = maps[i]['ESTADO'];

      return v;
    });

    return visitas;
  }

  static Future<List<Cliente>> getClientes() async {
    final db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('CB_PESSOA');

    return List.generate(maps.length, (i) {
      Cliente c = Cliente();

      c.apelido = maps[i]['NOME'];

      return c;
    });
  }

  static Future<List<Rota>> getRotas() async {
    final db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('rotas');

    return List.generate(
      maps.length,
      (i) {
        Rota r = Rota();
        r.nome = maps[i]['NOME'];
        return r;
      },
    );
  }



  static Future<List<Graph>> getGraphList() async {
    List<String> x = [
      'Cerv 1/1',
      'Quantidade e Total Liquido R\$ Por itens : Descrição',
      'Quantidade Meta e Meta alcançada Por Outros Cadastros : Descrição',
      'Valor Venda e Valor comisssão'
    ];

    return List.generate(x.length, (i) {
      Graph g = Graph();
      g.nome = x[i];

      return g;
    });
  }


  static Future<List<Produto>> getProdutoList() async {
    final Database db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('CP_PRODUTO');

    return List.generate(maps.length, (i) {
      return Produto(id: maps[i]['ID'], nome: maps[i]['NOME']);
    });
  }

  static Future<Produto> getProdutoDet(int id) async {

    String args = "VW_PRODUTO_DET.ID = ?";
    List<int> param= [id];

    final Database db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('VW_PRODUTO_DET', where: args, whereArgs: param);

    return List.generate(maps.length, (i) {


      final p = Produto(id: maps[i]['ID'], nome: maps[i]['NOME']);
      p.grupo = maps[i]['GRUPO'];
      p.subGrupo = maps[i]['SUBGRUPO'];
      p.unidade = maps[i]['UNIDADE'];
      p.departamento = maps[i]['DEPARTAMENTO'];
      p.status = maps[i]['STATUS'];
      p.descricao = maps[i]['DESCRICAO'];
      p.preco = maps[i]['PRECO'].toDouble();

      // try{
      //
      // } catch (e){
      //   debugPrint(e.toString());
      // }



      return p;
    })[0];
  }



}
