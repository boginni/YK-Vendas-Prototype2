
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:loja_virtual/screens/Novo%20Cliente/novo_cliente.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
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
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home2'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home3'),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home4'),
            ),
          ),
          NovoCliente(),


        ],
      ),
    );
  }
}