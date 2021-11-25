import 'package:flutter/material.dart';
import 'package:pin_shop/model/category_model.dart';
import 'package:pin_shop/model/product_model.dart';
import 'package:pin_shop/ui/cart/cart_screen.dart';
import 'package:pin_shop/ui/catalog/catalog_screen.dart';
import 'package:pin_shop/ui/checkout/checkout_screen.dart';
import 'package:pin_shop/ui/home/home_screen.dart';
import 'package:pin_shop/ui/product/product_screen.dart';
import 'package:pin_shop/ui/splash/splash_screen.dart';
import 'package:pin_shop/ui/wishlist/wishlist_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(
            category: settings.arguments as CategoryModel);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as ProductModel);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
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
