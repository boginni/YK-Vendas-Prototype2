import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle:  true,

      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration.collapsed(hintText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email){
                  return null;
                },
              ), // Email

              TextFormField(
                decoration: const InputDecoration.collapsed(hintText: 'Senha'),
                autocorrect: false,
                obscureText: true,
                validator: (pass){
                  if(pass!.isEmpty || pass.length < 6){
                    return 'Senha inválida';
                  }
                  return null;
                },
              ),// Senha

            ],
          ),
        )

      ),


    );
  }

}