import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/common/tiles/default_tiles.dart';
import 'package:loja_virtual/models/database_objects/cliente.dart';

class TelaConfirmarCliente extends StatelessWidget {
  Cliente cliente = Cliente();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Cliente'),
        actions: [
          const Icon(
            Icons.share,
            size: 32,
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Card(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                children: [
                  Column(
                    children: [
                      TileText(
                          title: 'Tipo do Cliente', value: 'Pessoa Física'),
                      TileText(title: 'Nome', value: cliente.nomeFantasia),
                      TileText(title: 'CPF', value: cliente.cpf),
                      TileText(
                          title: 'Data de nascimento',
                          value: cliente.dataNascimento),
                      TileText(title: 'Celular', value: cliente.celular),
                      TileText(title: 'Estado', value: 'Pará'),
                      TileText(title: 'Municipio', value: cliente.municipio),
                      TileText(title: 'Bairro', value: cliente.bairro),
                      TileText(title: 'Numero', value: cliente.numero),
                      TileText(title: 'CPF / CNPJ', value: cliente.cpf),
                    ],
                  ),

                  ///
                  Column(
                    children: [
                      TileText(
                          title: 'Criar Visita para o Novo Cliente',
                          value: '0'),
                      TileText(
                        title: 'Apelido',
                        value: cliente.apelido,
                      ),
                      TileText(title: 'RG', value: cliente.rg),
                      TileText(title: 'DDD Celular', value: cliente.dddCelular),
                      TileText(title: 'País', value: 'Brasil'),
                      TileText(title: 'Cidade', value: cliente.cidade),
                      TileText(title: 'Cep', value: cliente.cep),
                      TileText(title: 'Logradouro', value: cliente.logradouro),
                      TileText(title: 'Rota', value: cliente.rota),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}