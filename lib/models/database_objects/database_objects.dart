import 'package:brasil_fields/brasil_fields.dart';

abstract class DatabaseObject {
  Map<String, dynamic> toMap();
}

class Produto {
  int id;
  String nome;

  Produto({this.nome = '', this.id = 0});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome};
  }
}

class Cliente {
  Cliente();

  int id = 0;

  String apelido = "";
  String nomeFantasia = "";
  String cnpj = "";
  String inscricaoEstadual = "";
  String cpf = "";
  String rg = "";
  String dataNascimento = "";
  String dddCelular = "";
  String celular = "";
  String dddTelefone = "";
  String telefone = "";
  String email = "";
  String obs = "";
  String cidade = "";
  String municipio = "";
  String cep = "";
  String bairro = "";
  String logradouro = "";
  String numero = "";
  String complementoLogadouro = "";
  String rota = "";

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

class Visita {
  int idPessoa = 0;
  String apelido = "";
  String nome = "";
  String logradouro = "";
  String numero = "";
  String cep = "";
  String bairro = "";
  String cidade = "";
  String uf = "";
  String estado = "";

  String getEndereco() {
    var cep = UtilBrasilFields.obterCep(this.cep, ponto: false);

    return logradouro + " - " + bairro + " - " + cidade + " - " + cep;
  }
}

class Rota {
  String nome = '';
  int id = 0;
}

class Graph {
  int id = 0;
  String nome = '';
}
