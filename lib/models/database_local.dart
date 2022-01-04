import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocal {
  static Future<Database> getDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'local.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE clientes ( id INTEGER  PRIMARY KEY  NOT NULL, nome  VARCHAR (100) NOT NULL, apelido VARCHAR (100), cpf INTEGER (11)  UNIQUE, cnpj  INTEGER (14)  UNIQUE, rg VARCHAR (100), observacao TEXT, bairro  VARCHAR (32), logradouro VARCHAR (64), numero  VARCHAR (16) );CREATE TABLE produtos ( id INTEGER  PRIMARY KEY NOT NULL, nome VARCHAR (100), categoria INTEGER);CREATE TABLE rotas ( id INTEGER  PRIMARY KEY NOT NULL, nome VARCHAR (100) );CREATE TABLE visita_cab ( id INTEGER PRIMARY KEY NOT NULL, id_cliente INTEGER NOT NULL REFERENCES clientes (id), id_rota INTEGER REFERENCES rotas (id) NOT NULL, id_status  INTEGER REFERENCES status (id) NOT NULL);CREATE TABLE status ( id INTEGER PRIMARY KEY NOT NULL, descricao TEXT NOT NULL UNIQUE);INSERT INTO status (id, descricao) VALUES (1, 'ATIVO');INSERT INTO status (id, descricao) VALUES (2, 'INATIVO');"
        );
      },
      version: 1,
    );
  }
}
