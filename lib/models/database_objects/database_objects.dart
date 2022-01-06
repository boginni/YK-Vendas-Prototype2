abstract class DatabaseObject {
  Map<String, dynamic> toMap();
}

class Produto {
  int id;
  String nome;

  Produto({this.nome = '', this.id = 0});

  Map<String, dynamic> toMap(){
    return {'id': id, 'nome': nome};
  }
}

class Cliente {
  Cliente(this.nomeFantasia);

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
  String apelido = "";
  String nome = "";
  String endereco = "";
}
