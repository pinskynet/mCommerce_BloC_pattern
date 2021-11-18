// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pin_shop/UI/home/home_components/custom_app_bar.dart';
import 'package:pin_shop/UI/home/home_components/custom_nav_bar.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist_screen';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
