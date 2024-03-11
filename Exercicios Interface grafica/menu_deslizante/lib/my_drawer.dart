import 'package:flutter/material.dart';
import 'package:menu_deslizante/drawer_item.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu Deslizante',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          DrawerItem(
            icon: Icons.star,
            title: 'Item 1',
            onTap: () {
              // Ação quando o Item 1 é tocado
              Navigator.pop(context);
              // Adicione aqui a navegação para a tela desejada
            },
          ),
          DrawerItem(
            icon: Icons.star,
            title: 'Item 2',
            onTap: () {
              // Ação quando o Item 2 é tocado
              Navigator.pop(context);
              // Adicione aqui a navegação para a tela desejada
            },
          ),
          DrawerItem(
            icon: Icons.star,
            title: 'Item 3',
            onTap: () {
              // Ação quando o Item 3 é tocado
              Navigator.pop(context);
              // Adicione aqui a navegação para a tela desejada
            },
          ),
        ],
      ),
    );
  }
}
