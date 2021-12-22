import 'package:flutter/material.dart';
import 'package:loja_virtual/common/FormField/form_dropdown.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';

class TelaConfiguracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Container(

        child: Card(

          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Form(
              child: Column(
                children: <Widget>[
                  FormIdioma()..title = "Idioma",
                  FormTipoTeclado()
                    ..title = "Tipo de teclado utilizado nas pesquisas",
                  FormOpcoesAdicionaisPesquisa()
                    ..title = "Opções adicionais de pesquisa",
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Status do aplicativo',
                    style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                  ),
                  Divider(color: Colors.grey),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(

                      children: const [
                        Text('Quantidade de dados pendentes de envio'),
                        Text('Quantidade de mídias pendentes de envio'),
                        Divider(color: Colors.grey),
                        Text('Sincronizado em '),
                        Divider(color: Colors.grey),
                        Text('Versão do aplicativo'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.check_sharp,
          size: 32,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
