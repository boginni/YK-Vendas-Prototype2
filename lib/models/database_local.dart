import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_objects/database_objects.dart';

abstract class DatabaseLocal {
  static String getCurrentTime() {
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
  }

  static const int version = 4;

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

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> insertChegadaCliente(ChegadaCliente x) async {
    try {
      final db = await getDatabase();
      await db.insert(
        'CP_VISITA_CHEGADA',
        x.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );

    } catch (e) {

      debugPrint(e.toString());
    }
  }

  static Future<List<Map<String, dynamic>>> query(
      final String table, final String where, final List<dynamic> whereArgs) async {

    late final List<Map<String, dynamic>> maps;




    final db = await DatabaseLocal.getDatabase();

    try{

      if(where.isEmpty){
        maps = await db.query(table);
      } else {
        maps = await db.query(table, where: where, whereArgs: whereArgs);
      }

      // onSucces();
    } catch (e){

      debugPrint(e.toString());
      // onFail();
    }

    return maps;
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


    return r;
  }
}

class BufferTranslator {



  static Future<List<Visita>> getListVisitas(int idRota) async {

    final List<Map<String, dynamic>> maps =
      await DatabaseLocal.query('VW_VISITA', 'ID_ROTA = ?', [idRota]);

    final visitas = List.generate(maps.length, (i) {
      Visita v = Visita.createObject(maps[i]);

      // v.id = maps[i]["ID_VISITA"];
      // v.idPessoa = maps[i]['ID_PESSOA'];
      // v.nome = maps[i]['NOME'];
      //
      // v.logradouro = maps[i]['LOGRADOURO'];
      // v.numero = maps[i]['NUMERO'];
      // v.cep = maps[i]['CEP'];
      // v.bairro = maps[i]['BAIRRO'];
      // v.cidade = maps[i]['CIDADE'];
      // v.uf = maps[i]['UF'];
      // v.estado = maps[i]['ESTADO'];
      //
      // v.chegadaConcluida = _bool(maps[i]['CHEGADA_CONCLUIDA']);
      // v.tabelaConcluida = _bool(maps[i]['TABELA_CONCLUIDA']);
      // v.pedidoConcluida = _bool(maps[i]['PEDIDO_CONCLUIDA']);
      // v.vendaConcluida = _bool(maps[i]['VENDA_CONCLUIDA']);

      return v;
    });

    return visitas;
  }

  static Future<Visita> getVisita(int idVisita) async {

    final db = await DatabaseLocal.getDatabase();
    String where = "ID_VISITA = ?";
    List<dynamic> whereArgs = [idVisita];


    final List<Map<String, dynamic>> maps =
        await db.query('VW_VISITA', where: where, whereArgs: whereArgs);




    final visitas = List.generate(maps.length, (i) {

      Visita v = Visita.createObject(maps[i]);

      // v.id = maps[i]["ID_VISITA"];
      // v.idPessoa = maps[i]['ID_PESSOA'];
      // v.nome = maps[i]['NOME'];
      //
      // v.logradouro = maps[i]['LOGRADOURO'];
      // v.numero = maps[i]['NUMERO'];
      // v.cep = maps[i]['CEP'];
      // v.bairro = maps[i]['BAIRRO'];
      // v.cidade = maps[i]['CIDADE'];
      // v.uf = maps[i]['UF'];
      // v.estado = maps[i]['ESTADO'];
      //
      // v.chegadaConcluida = _bool(maps[i]['CHEGADA_CONCLUIDA']);
      // v.tabelaConcluida = _bool(maps[i]['TABELA_CONCLUIDA']);
      // v.pedidoConcluida = _bool(maps[i]['PEDIDO_CONCLUIDA']);
      // v.vendaConcluida = _bool(maps[i]['VENDA_CONCLUIDA']);

      return v;
    });

    return visitas[0];
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
      return Produto(idProduto: maps[i]['ID'], nome: maps[i]['NOME']);
    });
  }

  static const statusAtivo = 3;

  static Future<List<ItemVisita>> getItensVisita(int idVisita) async {
    final Database db = await DatabaseLocal.getDatabase();

    String args = "STATUS = ? AND ID_VISITA = ?";
    List<int> param = [statusAtivo, idVisita];

    final List<Map<String, dynamic>> maps =
        await db.query('VW_VISITA_ITEM', where: args, whereArgs: param);

    return List.generate(maps.length, (i) {
      final item = ItemVisita();
      final produto = Produto();

      produto.idProduto = maps[i]['ID_PRODUTO'];
      produto.nome = maps[i]['NOME'];
      item.quantidade = maps[i]['QUANTIDADE'];
      item.produto = produto;
      item.idVisita = idVisita;

      return item;
    });
  }

  //ID_VISITA	ID_PRODUTO	NOME	PRECO	TOTAL	QUANTIDADE	DESCRICAO	GRUPO	SUBGRUPO	UNIDADE	STATUS	DEPARTAMENTO

  static Future<Produto> getProdutoDet(int idVisita, int idProduto) async {
    final Database db = await DatabaseLocal.getDatabase();

    String args = "ID_VISITA = ? and ID_PRODUTO = ?";
    List<int> param = [idVisita, idProduto];

    final List<Map<String, dynamic>> maps =
        await db.query('VW_PRODUTO_DET', where: args, whereArgs: param);

    final p = Produto(idProduto: maps[0]['ID_PRODUTO'], nome: maps[0]['NOME']);

    p.grupo = maps[0]['GRUPO'];
    p.subGrupo = maps[0]['SUBGRUPO'];
    p.unidade = maps[0]['UNIDADE'];
    p.departamento = maps[0]['DEPARTAMENTO'];
    p.status = maps[0]['STATUS'];
    p.descricao = maps[0]['DESCRICAO'];
    p.idVisita = maps[0]['ID_VISITA'];

    p.total = maps[0]['TOTAL'].toDouble();
    p.preco = maps[0]['PRECO'].toDouble();

    return p;
  }

  static Future<TotaisPedido> getTotaisPedido(int idVisita) async {
    //VW_TOTAIS_PEDIDO

    final db = await DatabaseLocal.getDatabase();
    String where = "ID_VISITA = ?";
    List<dynamic> whereArgs = [idVisita];


    final List<Map<String, dynamic>> maps =
        await db.query('VW_TOTAIS_PEDIDO', where: where, whereArgs: whereArgs);

    final t = TotaisPedido();

    t.total = maps[0]['TOTAL'].toDouble();
    t.totalLiquido = maps[0]['TOTAL'].toDouble();
    t.quantidade = maps[0]['QUANTIDADE'];
    t.itens = maps[0]['PRODUTOS'];

    return t;
  }
}

bool _bool(int b) {
  return b == 1 ? true : false;
}
