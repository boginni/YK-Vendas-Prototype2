import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int i = 0;
    return Drawer(
      child: ListView(
        children: <Widget>[
          // DrawerTile(iconData: Icons.home, title: 'Início', page: i++,),
          DrawerTile(iconData: Icons.list, title: 'Produtos',page: i++,),
          DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus Pedidos',page: i++,),
          DrawerTile(iconData: Icons.location_city, title: 'Lojas',page: i++,),
          DrawerTile(iconData: Icons.location_city, title: 'Novo Cliente',page: i++,),
        ],
      ),

    );

  }

}