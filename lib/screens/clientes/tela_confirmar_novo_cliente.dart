import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaConfirmarCliente extends StatelessWidget {
  // const TelaConfirmarCliente();

  static const routeName = '/telaConfirmarNovoCliente';

  const TelaConfirmarCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // Cliente cliente = ModalRoute.of(context)!.settings.arguments as Cliente;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Cliente'),
        actions: const <Widget>[
          Icon(
            Icons.share,
            size: 32,
          ),
        ],
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Card(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: const <Widget>[
                      Text('Title'),
                      Text('Value'),
                      Divider(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const <Widget>[
                      Text('Title'),
                      Text('Value'),
                      Divider(),
                    ],
                  ),
                ),
              ],
            ),

            // Row(
            //   children: [
            //     Column(
            //       children: [
            //         TileText(
            //             title: 'Tipo do Cliente', value: 'Pessoa Física'),
            //         TileText(title: 'Nome', value: cliente.nomeFantasia),
            //         TileText(title: 'CPF', value: cliente.cpf),
            //         TileText(
            //             title: 'Data de nascimento',
            //             value: cliente.dataNascimento),
            //         TileText(title: 'Celular', value: cliente.celular),
            //         TileText(title: 'Estado', value: 'Pará'),
            //         TileText(title: 'Municipio', value: cliente.municipio),
            //         TileText(title: 'Bairro', value: cliente.bairro),
            //         TileText(title: 'Numero', value: cliente.numero),
            //         TileText(title: 'CPF / CNPJ', value: cliente.cpf),
            //       ],
            //     ),
            //
            //     ///
            //     Column(
            //       children: [
            //         TileText(
            //             title: 'Criar Visita para o Novo Cliente',
            //             value: '0'),
            //         TileText(
            //           title: 'Apelido',
            //           value: cliente.apelido,
            //         ),
            //         TileText(title: 'RG', value: cliente.rg),
            //         TileText(title: 'DDD Celular', value: cliente.dddCelular),
            //         TileText(title: 'País', value: 'Brasil'),
            //         TileText(title: 'Cidade', value: cliente.cidade),
            //         TileText(title: 'Cep', value: cliente.cep),
            //         TileText(title: 'Logradouro', value: cliente.logradouro),
            //         TileText(title: 'Rota', value: cliente.rota),
            //       ],
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
