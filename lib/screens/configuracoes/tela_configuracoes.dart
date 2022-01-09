import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/form_field/formulario.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaConfiguracoes extends ModdelScreen {

  const TelaConfiguracoes({Key? key}) : super(key: key);

  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Card(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Form(
            child: Column(
              children:  <Widget>[
                FormIdioma(title: "Idioma"),
                FormTipoTeclado(
                    title: "Tipo de teclado utilizado nas pesquisas"),
                FormOpcoesAdicionaisPesquisa(
                  title: "Opções adicionais de pesquisa",
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Status do aplicativo',
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                ),
                const Divider(color: Colors.grey),
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
