import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaViewProduto extends StatelessWidget {
  static const routeName = '/telaViewProduto';

  const TelaViewProduto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View produto'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Center(child: Text("Unused")),
    );
  }
}
