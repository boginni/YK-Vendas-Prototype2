import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int i = 0;
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Logo da Empresa',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20,),
                Text(
                  'Aplicativo Móvel',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                Text('Usuário',
                    style: TextStyle(fontSize: 14), textAlign: TextAlign.left),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          DrawerTile(
            iconData: Icons.login,
            title: 'Login',
            page: i++,
          ),
          DrawerTile(
            iconData: Icons.person_add_outlined,
            title: 'Novo Cliente',
            page: i++,
          ),
          const Divider(color: Colors.grey),

          DrawerTile(
            iconData: Icons.message_outlined,
            title: 'Mensagens',
            page: i++,
          ),

          DrawerTile(
            iconData: Icons.map,
            title: 'Roteirizador',
            page: i++,
          ),
          DrawerTile(
            iconData: Icons.map_outlined,
            title: 'Rotas',
            page: i++,
          ),

          DrawerTile(
            iconData: Icons.hourglass_bottom,
            title: 'Consultas',
            page: i++,
          ),
          //Painel de Gestão
          DrawerTile(
            iconData: Icons.insert_chart_outlined,
            title: 'Painel de Gestão',
            page: i++,
          ),
          //Incluir Visita na Agenda
          DrawerTile(
            iconData: Icons.person_add_outlined,
            title: 'Incluir Visita na Agenda',
            page: i++,
          ),

          const Divider(color: Colors.grey),
          DrawerTile(
            iconData: Icons.settings,
            title: 'Configurações',
            page: i++,
          ),
          const Divider(color: Colors.grey),
          DrawerTile(
            iconData: Icons.logout,
            title: 'Sair',
            page: i++,
          ),
        ],
      ),
    );
  }
}
