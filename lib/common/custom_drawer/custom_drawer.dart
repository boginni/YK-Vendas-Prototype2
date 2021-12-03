import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerTile(iconData: Icons.home, title: 'Início', page: 0,),
          DrawerTile(iconData: Icons.list, title: 'Produtos',page: 1,),
          DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus Pedidos',page: 2,),
          DrawerTile(iconData: Icons.location_city, title: 'Lojas',page: 3,),
        ],
      ),

    );

  }

}