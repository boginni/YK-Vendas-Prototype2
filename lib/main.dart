import 'package:flutter/material.dart';
import 'package:forca_de_vendas/screens/base/base_screen.dart';
import 'package:forca_de_vendas/screens/clientes/novo_cliente.dart';
import 'package:forca_de_vendas/screens/clientes/tela_confirmar_novo_cliente.dart';
import 'package:forca_de_vendas/screens/produtos/tela_novo_produto.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_dados_da_entrega.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_item_do_pedido.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_itens_do_pedido.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_tabela_de_preco.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_pedido/tela_totais_do_pedido.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/chegada_cliente.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/tela_pedido.dart';
import 'package:forca_de_vendas/screens/tela_principal/tela_visita/tela_visita_realizada.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Forca de vendas",
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        routes: {
          TelaVisita.routeName: (context) => const TelaVisita(),
          TelaChegadaCliente.routeName: (context) => const TelaChegadaCliente(),
          TelaPedido.routeName: (context) => const TelaPedido(),
          TelaTotaisPedido.routeName: (context) => const TelaTotaisPedido(),
          TelaDadosEntrega.routeName: (context) =>const  TelaDadosEntrega(),
          TelaItensPedido.routeName: (context) =>const  TelaItensPedido(),
          TelaTabelaPreco.routeName: (context) => const TelaTabelaPreco(),
          TelaVisitaRealizada.routeName: (context) => const TelaVisitaRealizada(),
          TelaItemPedido.routeName: (context) => const TelaItemPedido(),
          TelaConfirmarCliente.routeName: (context) => const TelaConfirmarCliente(),
          TelaNovoProduto.routeName: (context) => const TelaNovoProduto(),
          TelaNovoCliente.routeName: (context) => const TelaNovoCliente(),
          BaseScreen.routeName: (context) => const BaseScreen(),
        },

        initialRoute: '/base',

        onGenerateRoute: (settings) {

          return MaterialPageRoute(builder: (_) => const BaseScreen());

          // switch (settings.name) {
          //   // case '/chegadaCliente':
          //   //   return MaterialPageRoute(builder: (_) => TelaChegadaCliente());
          //   // case '/pedido':
          //   //   return MaterialPageRoute(builder: (_) => TelaPedido());
          //   // case '/telaTotaisPedido':
          //   //   return MaterialPageRoute(builder: (_) => TelaTotaisPedido());
          //   // case '/telaDadosEntrega':
          //   //   return MaterialPageRoute(builder: (_) => TelaDadosEntrega());
          //   // case '/telaItensPedido':
          //   //   return MaterialPageRoute(builder: (_) => TelaItensPedido());
          //   // case '/telaTabelaPreco':
          //   //   return MaterialPageRoute(builder: (_) => TelaTabelaPreco());
          //   // case '/visitaRealizada':
          //   //   return MaterialPageRoute(builder: (_) => TelaVisitaRealizada());
          //   // case '/telaItemPedido':
          //   //   return MaterialPageRoute(builder: (_) => TelaItemPedido());
          //   // case '/telaConfirmarNovoCliente':
          //   //   return MaterialPageRoute(builder: (_) => TelaConfirmarCliente());
          //   // case '/telaNovoProduto':
          //   //   return MaterialPageRoute(builder: (_) => TelaNovoProduto());
          //   // case '/telaNovoCliente':
          //   //   return MaterialPageRoute(builder: (_) => TelaNovoCliente());
          //   case '/base':
          //   default:
          //
          // }
        }

        );
  }
}
