import 'package:flutter/material.dart';

class MeuWidget extends StatefulWidget {
  const MeuWidget({Key? key}) : super(key: key);

  @override
  _MeuWidgetState createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<MeuWidget> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_contador',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                'Adicionar +1',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onPressed: _incrementarContador,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text(
                'Zerar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(() {
                  _contador = 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(fontSize: 22),
              onChanged: (text) {
                int qtd = int.parse(text.isEmpty ? '0' : text);
                setState(() {
                  _contador = qtd;
                });

              },
            ),

          ],
        ),
      ),
    );
  }
}
