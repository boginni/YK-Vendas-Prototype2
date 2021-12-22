
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:loja_virtual/screens/configura%C3%A7%C3%B5es/tela_configuracoes.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:loja_virtual/screens/mensagens/mensagens.dart';
import 'package:loja_virtual/screens/novo%20cliente/novo_cliente.dart';
import 'package:loja_virtual/screens/rotas/tela_rotas.dart';
import 'package:provider/provider.dart';

import '../../common/custom_drawer/custom_drawer.dart';




class BaseScreen extends StatelessWidget{

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
          LoginScreen(),
          TelaNovoCliente(),
          TelaMensagens(), // mensagens
          TelaRotas(),//Roteirizador
          TelaRotas(),//Rotas
          Scaffold(),//Consultas
          Scaffold(),//Painel
          Scaffold(),//Incluir visita
          TelaConfiguracoes(),
          Scaffold(),//Sair

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