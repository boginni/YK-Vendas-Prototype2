import 'package:flutter/material.dart';
import 'package:forca_de_vendas/models/page_manager.dart';
import 'package:forca_de_vendas/screens/clientes/tela_clientes.dart';
import 'package:forca_de_vendas/screens/configuracoes/tela_configuracoes.dart';
import 'package:forca_de_vendas/screens/consultas/tela_consultas.dart';
import 'package:forca_de_vendas/screens/graficos/tela_graficos.dart';
import 'package:forca_de_vendas/screens/login/login_screen.dart';
import 'package:forca_de_vendas/screens/mensagens/mensagens.dart';
import 'package:forca_de_vendas/screens/painel_de_gerenciamento/painel_de_gerenciamento.dart';
import 'package:forca_de_vendas/screens/produtos/tela_produtos.dart';
import 'package:forca_de_vendas/screens/rotas/tela_rotas.dart';
import 'package:forca_de_vendas/screens/roteirizador/tela_roteirizador.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_principal.dart';
import 'package:forca_de_vendas/screens/testes/test_dogs.dart';
import 'package:forca_de_vendas/screens/visita_agenda/tela_incluir_visita_na_agenda.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  static const routeName = '/base';

  const BaseScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    // TODO: implement build
    return Provider(
      create: (_) => PageManager(pageController: pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          TelaPrincipal(),
          TelaTesteDogs(),
          TelaClientes(),
          TelaProdutos(),
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
