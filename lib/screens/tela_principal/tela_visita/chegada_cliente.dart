import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/tiles/default_tiles.dart';

class TelaChegadaCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chegada no Cliente'),
        centerTitle: true,
        leading: BackButton(
          ///chegadaCliente
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Container(
        child: Card(
          child: ListView(
            children: [
              TileText(
                title: 'Data',
                value: 'Not Implemented',
              ),
              TileText(
                title: 'Hora',
                value: 'Not Implemented',
              ),
              Text('Resumo Financeiro do Cliente'),
              TileText(
                title: 'Títulos a Vencer',
                value: '0.00',
              ),
              TileText(
                title: 'Limite de Credito',
                value: '0.00',
              ),
              TileText(
                title: 'Informações da Última visita',
                value: 'Realizado com Sucesso',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
