import 'package:flutter/material.dart';
import 'package:forca_de_vendas/screens/base/base_screen.dart';
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
  runApp(MyApp());
}

class testApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Test'),),
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
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/telaVisita':
              return MaterialPageRoute(builder: (_) => TelaVisita());
            case '/chegadaCliente':
              return MaterialPageRoute(builder: (_) => TelaChegadaCliente());
            case '/pedido':
              return MaterialPageRoute(builder: (_) => TelaPedido());
            case '/telaTotaisPedido':
              return MaterialPageRoute(builder: (_) => TelaTotaisPedido());
            case '/telaDadosEntrega':
              return MaterialPageRoute(builder: (_) => TelaDadosEntrega());
            case '/telaItensPedido':
              return MaterialPageRoute(builder: (_) => TelaItensPedido());
            case '/telaTabelaPreco':
              return MaterialPageRoute(builder: (_) => TelaTabelaPreco());
            case '/visitaRealizada':
              return MaterialPageRoute(builder: (_) => TelaVisitaRealizada());
            case '/telaItemPedido':
              return MaterialPageRoute(builder: (_) => TelaItemPedido());
            case '/telaConfirmarNovoCliente':
              return MaterialPageRoute(builder: (_) => TelaConfirmarCliente());
            case '/telaNovoProduto':
              return MaterialPageRoute(builder: (_) => TelaNovoProduto());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        });
  }
}
