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

  static Future<void> insertItemVisita(ItemVisita item) async {
    try {
      final db = await getDatabase();
      await db.insert(
        'CP_VISITA_ITEM',
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // onSuccess();
    } catch (e) {
      // onFail();
    }
  }
}

class StoredConfig {
  static Future<void> setConfig(int id, dynamic x) async {
    final db = await DatabaseLocal.getDatabase();

    final String value = x.toString();

    //TODO check no tamanho da string

    await db.update('CONF_USER', {'VALOR': value},
        where: 'ID = ?', whereArgs: [id]);
  }

  static Future<String> getConfig(int id) async {
    final Database db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('CP_PRODUTO');

    return maps[0]["VALOR"];
  }

  static Future<Rota> ultimaRota() async {
    final Database db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('VW_ULTIMA_ROTA');

    Rota r = Rota();

    r.id = maps[0]['ID'];
    r.nome = maps[0]['NOME'];

    debugPrint(r.id.toString());

    return r;
  }



}

class BufferTranslator {


  static Future<List<Visita>> getVisitas(int idRota) async {
    final db = await DatabaseLocal.getDatabase();
    String where = "ID_ROTA = ?";
    List<dynamic> whereArgs = [idRota];

    // debugPrint(idRota.toString());

    final List<Map<String, dynamic>> maps =
        await db.query('VW_VISITA', where: where, whereArgs: whereArgs);

    final visitas = List.generate(maps.length, (i) {
      Visita v = Visita();

      v.id = maps[i]["ID"];
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
    final List<Map<String, dynamic>> maps = await db.query('CP_ROTAS');

    return List.generate(
      maps.length,
      (i) {
        Rota r = Rota();
        r.nome = maps[i]['NOME'];
        r.id = maps[i]['ID'];
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

  static const statusAtivo = 3;
  static Future<List<ItemVisita>> getItensVisita(int idVisita) async {
    final Database db = await DatabaseLocal.getDatabase();

    String args = "STATUS = ? AND ID_VISITA = ?";
    List<int> param = [statusAtivo, idVisita];




    final List<Map<String, dynamic>> maps = await db.query('VW_VISITA_ITEM', where: args,whereArgs: param);



    return List.generate(maps.length, (i) {
      final item = ItemVisita();
      final produto = Produto();

      produto.id = maps[i]['ID_PRODUTO'];
      produto.nome = maps[i]['NOME'];
      item.quantidade = maps[i]['QUANTIDADE'];
      item.produto = produto;
      item.idVisita = idVisita;

      return item;
    })

    ;
  }

  static Future<Produto> getProdutoDet(int id) async {


    final Database db = await DatabaseLocal.getDatabase();


    String args = "VW_PRODUTO_DET.ID = ?";
    List<int> param = [id];


    final List<Map<String, dynamic>> maps =
        await db.query('VW_PRODUTO_DET', where: args, whereArgs: param);

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

  static Future<TotaisPedido> getTotaisPedido(int idVisita) async {
    //VW_TOTAIS_PEDIDO

    final db = await DatabaseLocal.getDatabase();
    String where = "ID_VISITA = ?";
    List<dynamic> whereArgs = [idVisita];

    // debugPrint(idRota.toString());

    final List<Map<String, dynamic>> maps =
    await db.query('VW_TOTAIS_PEDIDO', where: where, whereArgs: whereArgs);

    final t = TotaisPedido();

    t.total = maps[0]['TOTAL'].toDouble();
    t.totalLiquido = maps[0]['TOTAL'].toDouble();

    return t;
  }
}
