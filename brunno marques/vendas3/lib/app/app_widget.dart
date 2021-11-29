
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class appWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      onGenerateRoute: Modular.,

    );
  }
}
