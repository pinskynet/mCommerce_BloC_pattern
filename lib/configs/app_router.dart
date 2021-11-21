import 'package:flutter/material.dart';
import 'package:pin_shop/model/category_model.dart';
import 'package:pin_shop/model/product_model.dart';
import 'package:pin_shop/ui/cart/cart_screen.dart';
import 'package:pin_shop/ui/catalog/catalog_screen.dart';
import 'package:pin_shop/ui/home/home_screen.dart';
import 'package:pin_shop/ui/product/product_screen.dart';
import 'package:pin_shop/ui/wishlist/wishlist_screen.dart';

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
        return ProductScreen.route(product: settings.arguments as ProductModel);
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
