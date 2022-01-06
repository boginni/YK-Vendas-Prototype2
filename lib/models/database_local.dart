import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocal {
  static final int version = 2;

  static Future<Database> getDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'local.db'),
      // onOpen: (db) => creation(db, version),
      onCreate: (db, version) => creation(db, version),
      version: version,
    );
  }

  static Future<void> creation(db, version) async {
    print('recreating database');

    db.execute(
        "CREATE TABLE clientes ( id INTEGER  PRIMARY KEY  NOT NULL, nome  VARCHAR (100) NOT NULL, apelido VARCHAR (100), cpf INTEGER (11)  UNIQUE, cnpj  INTEGER (14)  UNIQUE, rg VARCHAR (100), observacao TEXT, bairro  VARCHAR (32), logradouro VARCHAR (64), numero  VARCHAR (16) );");
    db.execute(
        'CREATE TABLE produtos ( id INTEGER  PRIMARY KEY NOT NULL, nome VARCHAR (100), categoria INTEGER);');
    db.execute(
        'CREATE TABLE rotas ( id INTEGER  PRIMARY KEY NOT NULL, nome VARCHAR (100) );');
    db.execute(
        'CREATE TABLE visita_cab ( id INTEGER PRIMARY KEY NOT NULL, id_cliente INTEGER NOT NULL REFERENCES clientes (id), id_rota INTEGER REFERENCES rotas (id) NOT NULL, id_status  INTEGER REFERENCES status (id) NOT NULL);');
    db.execute(
        'CREATE TABLE status ( id INTEGER PRIMARY KEY NOT NULL, descricao TEXT NOT NULL UNIQUE);');
    db.execute("INSERT INTO status (id, descricao) VALUES (1, 'ATIVO');");
    db.execute("INSERT INTO status (id, descricao) VALUES (2, 'INATIVO');");
  }
}
