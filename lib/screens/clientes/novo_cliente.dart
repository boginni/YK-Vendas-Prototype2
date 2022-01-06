import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/common/form_field/formulario.dart';
import 'package:forca_de_vendas/models/database_local.dart';
import 'package:forca_de_vendas/models/database_objects/database_objects.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';
import 'package:sqflite/sqflite.dart';

class TelaNovoCliente extends ModdelScreen {
  final cliente = Cliente('teste');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Cliente'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: true,
            children: [
              FormTipoCliente(),
              FormSwitch(title: 'Criar visita para novo cliente?'),
              FormText(
                saveFunction: (txt) {
                  cliente.apelido = txt;
                },
                title: 'Apelido',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.nomeFantasia = txt;
                },
                title: 'Nome Fantasia',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.cnpj = txt;
                },
                title: 'CNPJ',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.inscricaoEstadual = txt;
                },
                title: 'Inscrição Estadual',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.cpf = txt;
                },
                title: 'CPF',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.rg = txt;
                },
                title: 'RG',
                mandatoryField: true,
              ),
              FormDataNascimento(
                title: 'Data de nascimento',
                mandatoryField: true,
              ),
              FormText(
                  saveFunction: (txt) {
                    cliente.dddCelular = txt;
                  },
                  title: 'DDD Celular'),
              FormText(
                saveFunction: (txt) {
                  cliente.celular = txt;
                },
                title: 'Celular',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.dddTelefone = txt;
                },
                title: 'DDD Telefone',
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.telefone = txt;
                },
                title: 'Telefone',
              ),
              FormText(
                  saveFunction: (txt) {
                    cliente.email = txt;
                  },
                  title: 'Email'),
              FormText(
                  saveFunction: (txt) {
                    cliente.obs = txt;
                  },
                  title: 'Observação'),
              FormCidade(
                title: 'Cidade',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.municipio = txt;
                },
                title: 'Município',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.cep = txt;
                },
                title: 'CEP',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.bairro = txt;
                },
                title: 'Bairro',
                mandatoryField: true,
              ),
              FormText(
                saveFunction: (txt) {
                  cliente.logradouro = txt;
                },
                title: 'Logradouro',
                mandatoryField: true,
              ),
              FormText(
                  saveFunction: (txt) {
                    cliente.numero = txt;
                  },
                  title: 'Número'),
              FormText(
                  saveFunction: (txt) {
                    cliente.complementoLogadouro = txt;
                  },
                  title: 'Complemento Logradouro'),
              FormRota(
                title: 'Rota',
                mandatoryField: true,
              ),
              FormImage(title: 'Foto CPF'),
              FormImage(title: 'Foto Comprovante de Residência'),
              FormImage(title: 'Foto Identidade'),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // print("Campos Validados");
            insertCliente(cliente);
            //Navigator.of(context).pushNamed('/telaConfirmarNovoCliente');
          }
        },
        child: const Text(
          "Adicionar",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}


Future<void> insertCliente(Cliente x) async {
  final db = await DatabaseLocal.getDatabase();

  await db.insert(
    'clientes',
    {
      'id': 1,
      'nome': x.nomeFantasia
    },
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
