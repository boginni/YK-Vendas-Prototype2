import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/common/FormField/form_button.dart';
import 'package:loja_virtual/common/FormField/form_dropdown.dart';
import 'package:loja_virtual/common/FormField/form_field.dart';
import 'package:loja_virtual/common/FormField/form_image.dart';
import 'package:loja_virtual/common/FormField/form_text.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/screens/base/moddel_screen.dart';

class Cliente{


  String apelido = "";
  String nomeFantasia = "";
  String cnpj = "";
  String inscricaoEstadual = "";
  String cpf = "";
  String rg = "";
  String dataNascimento = "";
  String dddCelular = "";
  String celular = "";
  String dddTelefone = "";
  String telefone = "";
  String email = "";
  String obs = "";
  String cidade = "";
  String municipio = "";
  String cep = "";
  String bairro = "";
  String logradouro = "";
  String numero = "";
  String complementoLogadouro = "";
  String rota = "";
}

class TelaNovoCliente extends ModdelScreen {



  final cliente = Cliente();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget getCustomScreen(BuildContext context) {
    var formfields = <ValueNotifier>[];

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Cliente'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                // padding: const EdgeInsets.all(16),

                children: [
                  FormTipoCliente()
                    ..title = 'Tipo de cliente'
                    ..mandatoryField = true, // Caixa de seleç
                  FormSwitch()
                    ..title = 'Criar visita para novo cliente?'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.apelido = txt; },)
                    ..title = 'Apelido'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt){cliente.nomeFantasia = txt; },)
                    ..title = 'Nome Fantasia'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.cnpj = txt; })
                    ..title = 'CNPJ'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.inscricaoEstadual = txt; })
                    ..title = 'Inscrição Estadual'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.cpf = txt; })
                    ..title = 'CPF'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.rg = txt; })
                    ..title = 'RG'
                    ..mandatoryField = true,
                  FormDataNascimento()
                    ..title = 'Data de nascimento'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.dddCelular = txt; })..title = 'DDD Celular',
                  FormText(saveFunction: (txt) { cliente.celular = txt; })
                    ..title = 'Celular'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.dddTelefone = txt; })..title = 'DDD Telefone',
                  FormText(saveFunction: (txt) { cliente.telefone = txt; })..title = 'Telefone',
                  FormText(saveFunction: (txt) { cliente.email = txt; })..title = 'Email',
                  FormText(saveFunction: (txt) { cliente.obs = txt; })..title = 'Observação',
                  FormCidade()
                    ..title = 'Cidade'
                    ..mandatoryField = true, //Escolha
                  FormText(saveFunction: (txt) { cliente.municipio = txt; })
                    ..title = 'Município'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.cep = txt; })
                    ..title = 'CEP'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.bairro = txt; })
                    ..title = 'Bairro'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.logradouro = txt; })
                    ..title = 'Logradouro'
                    ..mandatoryField = true,
                  FormText(saveFunction: (txt) { cliente.numero = txt; })..title = 'Número',
                  FormText(saveFunction: (txt) { cliente.complementoLogadouro = txt; })..title = 'Complemento Logradouro',
                  FormRota()
                    ..title = 'Rota'
                    ..mandatoryField = true, // Escolha
                  FormImage()..title = 'Foto CPF',
                  FormImage()..title = 'Foto Comprovante de Residência',
                  FormImage()..title = 'Foto Identi dade',
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(

        onPressed: () {
          if (formKey.currentState!.validate()) {
            print("Campos Validados");
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
