import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/common/FormField/form_dropdown.dart';
import 'package:loja_virtual/common/FormField/form_text.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';

class NovoCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Cliente'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              FormDropDown(title: 'Tipo de cliente'), // Caixa de seleç
              FormText(title: 'Criar visita para novo cliente?'),
              FormText(title: 'Apelido'),
              FormText(title: 'Nome Fantasia'),
              FormText(title: 'CNPJ'),
              FormText(title: 'Inscrição Estadual'),
              FormText(title: 'CPF'),
              FormText(title: 'RG'),
              FormText(title: 'Data de nascimento'),
              FormText(title: 'DDD Celular'),
              FormText(title: 'Celular'),
              FormText(title: 'DDD Telefone'),
              FormText(title: 'Telefone'),
              FormText(title: 'Email'),
              FormText(title: 'Observação'),
              FormText(title: 'Cidade'),
              FormText(title: 'Município'),
              FormText(title: 'CEP'),
              FormText(title: 'Bairro'),
              FormText(title: 'Logradouro'),
              FormText(title: 'Número'),
              FormText(title: 'Complemento Logradouro'),
              FormText(title: 'Rota'),
              FormText(title: 'Foto CPF'),
              FormText(title: 'Foto Comprovante de Residência'),
              FormText(title: 'Foto Identidade'),
            ],
          ),
        ),
      ),
    );
  }
}
