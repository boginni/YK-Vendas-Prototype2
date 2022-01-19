import 'package:brasil_fields/brasil_fields.dart';
import 'package:intl/intl.dart';

abstract class DatabaseObject {
  Map<String, dynamic> toMap();
}

class Produto {
  int idProduto;
  int idVisita = 0;
  String nome;
  String descricao = '';
  String grupo = '';
  String subGrupo = '';
  String unidade = '';
  String status = '';
  String departamento = '';
  double preco = 0.0;

  double total = 0.0;

  Produto({this.nome = '', this.idProduto = 0});

  Map<String, dynamic> toMap() {
    return {'id': idProduto, 'nome': nome};
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

  static Visita createObject(Map<String, dynamic> maps){
    Visita v = Visita();

    v.id = maps["ID_VISITA"];
    v.idPessoa = maps['ID_PESSOA'];
    v.nome = maps['NOME'];

    v.logradouro = maps['LOGRADOURO'];
    v.numero = maps['NUMERO'];
    v.cep = maps['CEP'];
    v.bairro = maps['BAIRRO'];
    v. cidade = maps['CIDADE'];
    v.uf = maps['UF'];
    v.estado = maps['ESTADO'];

    v.chegadaConcluida = _bool(maps['CHEGADA_CONCLUIDA']);
    v.tabelaConcluida = _bool(maps['TABELA_CONCLUIDA']);
    v.pedidoConcluida = _bool(maps['PEDIDO_CONCLUIDA']);
    v.vendaConcluida = _bool(maps['VENDA_CONCLUIDA']);

    return v;

  }


  int id = 0;
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

  bool chegadaConcluida = false;
  bool tabelaConcluida = false;
  bool pedidoConcluida = false;
  bool vendaConcluida = false;

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

class ItemVisita {
  int id = 0;
  int quantidade = 0;
  int idVisita = 0;
  Produto produto = Produto();

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      'ID_VISITA': idVisita,
      'ID_PRODUTO': produto.idProduto,
      'QUANTIDADE': quantidade,
    };

    if (id != 0) {
      map['ID'] = id;
    }

    return map;
  }
}

class TotaisPedido {
  double total = 0;
  double totalLiquido = 0;
  int quantidade = 0;
  int itens = 0;
}

class ChegadaCliente {
  late final DateTime chegada;
  final int idVisita;

  double titulosVencer = 0;
  double limiteCredito = 0;

  // late final String statusUltimaVisita;

  ChegadaCliente(this.idVisita){
    chegada = DateTime.now();
  }

  Map<String, Object?> toMap() {
    return {'ID_VISITA': idVisita, 'DATA': DateFormat('dd-MM-yyyy HH:mm:ss').format(chegada)};
  }
}



bool _bool(int b) {
  return b == 1 ? true : false;
}
