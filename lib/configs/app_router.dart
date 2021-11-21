import 'package:flutter/material.dart';

import '../export_files.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/cart_screen':
        return CartScreen.route();
      case '/catalog_screen':
        return CatalogScreen.route(
            category: settings.arguments as CategoryModel);
      case '/product_screen':
        return ProductScreen.route();
      case '/wishlist_screen':
        return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          centerTitle: true,
        ),
      ),
    );
  }
}
