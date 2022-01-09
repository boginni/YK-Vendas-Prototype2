import 'package:flutter/material.dart';
import 'package:forca_de_vendas/common/custom_drawer/custom_drawer.dart';
import 'package:forca_de_vendas/screens/base/moddel_screen.dart';

class TelaRoteirizador extends ModdelScreen{
  const TelaRoteirizador({Key? key}) : super(key: key);

  @override
  Widget getCustomScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text('Roteirizador'),),
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: const  Center(
        child: Text('Tela de Roteirização'),
      ),
    );
  }

}