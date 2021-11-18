import 'package:flutter/material.dart';
import 'package:pin_shop/UI/cart/cart_screen.dart';
import 'package:pin_shop/UI/category/category_screen.dart';
import 'package:pin_shop/UI/home/home_screen.dart';
import 'package:pin_shop/UI/product/product_screen.dart';
import 'package:pin_shop/UI/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/cart_screen':
        return CartScreen.route();
      case '/category_screen':
        return CategoryScreen.route();
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
