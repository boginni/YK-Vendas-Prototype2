import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/common/form_field/formulario.dart';
import 'package:loja_virtual/models/database_objects/cliente.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class TelaNovoCliente extends ModdelScreen {
  final cliente = Cliente();

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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: ListView(
              // padding: const EdgeInsets.all(16),

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
                FormImage(title: 'Foto Identi dade'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // print("Campos Validados");

            Navigator.of(context).pushNamed('/telaConfirmarNovoCliente');
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
