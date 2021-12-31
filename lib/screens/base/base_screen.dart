import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:loja_virtual/screens/clientes/tela_clientes.dart';
import 'package:loja_virtual/screens/configura%C3%A7%C3%B5es/tela_configuracoes.dart';
import 'package:loja_virtual/screens/consultas/tela_consultas.dart';
import 'package:loja_virtual/screens/graficos/tela_graficos.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:loja_virtual/screens/mensagens/mensagens.dart';
import 'package:loja_virtual/screens/clientes/novo_cliente.dart';
import 'package:loja_virtual/screens/painel%20de%20gerenciamento/painel_de_gerenciamento.dart';
import 'package:loja_virtual/screens/rotas/tela_rotas.dart';
import 'package:loja_virtual/screens/roteirizador/tela_roteirizador.dart';
import 'package:loja_virtual/screens/tela_principal/tela_principal.dart';
import 'package:loja_virtual/screens/testes/test_dogs.dart';
import 'package:loja_virtual/screens/visita%20agenda/tela_incluir_visita_na_agenda.dart';
import 'package:provider/provider.dart';

import '../../common/custom_drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider(
      create: (_) => PageManager(pageController: pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[

          TelaPrincipal(),
          TelaTesteDogs(),
          TelaClientes(),
          TelaNovoCliente(),
          TelaMensagens(), // mensagens
          TelaRoteirizador(), //Roteirizador
          TelaRotas(), //Rotas
          TelaConsultas(), //Consultas
          TelaPainelGerenciamento(), //Painel
          TelaGraficos(),
          TelaIncluirVisitaAgenda(), //Incluir visita
          TelaConfiguracoes(),
          LoginScreen(), //Sair
        ],
      ),
    );
  }
}

// return Scaffold(
// appBar: AppBar(
// title: Text('Novo Cliente'),
// centerTitle: true,
// ),
// drawer: CustomDrawer(),
// body: Center());
