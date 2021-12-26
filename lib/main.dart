import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_pedido/tela_dados_da_entrega.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_pedido/tela_itens_do_pedido.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_pedido/tela_tabela_de_preco.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_pedido/tela_totais_do_pedido.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_visita/chegada_cliente.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_visita/tela_pedido.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_principal.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_visita.dart';
import 'package:loja_virtual/screens/tela%20principal/tela_visita/tela_visita_realizada.dart';
import 'package:provider/provider.dart';

import 'models/user_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Container(
              child: Text('Erro'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          FirebaseFirestore.instance
              .collection('teste')
              .add({'teste': 'teste'});
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
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
              case '/base':
              default:
                return MaterialPageRoute(builder: (_) => BaseScreen());
            }
          }),
    );
  }
}
