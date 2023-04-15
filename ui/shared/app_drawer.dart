import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/auth_manager.dart';
import '../orders/orders_screen.dart';
import '../products/admin_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override 
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Cửa hàng rubik'),
            automaticallyImplyLeading: false,
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Cửa hàng '),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Đơn hàng'),
            onTap: () {
              Navigator.of(context)
                .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Đăng xuất '),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),

          
        ],
      ),
    );
  }
}