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
    }

    );

    return visitas;

  }

  static Future<List<Cliente>> getClientes() async {
    final db = await DatabaseLocal.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('clientes');

    return List.generate(maps.length, (i) {
      Cliente c = Cliente();

      c.apelido = maps[i]['NOME'];

      return c;
    });
  }

  Future<void> insertCliente(Cliente x) async {
    final db = await DatabaseLocal.getDatabase();

    await db.insert(
      'clientes',
      {'ID': x.id, 'NOME': x.nomeFantasia},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
