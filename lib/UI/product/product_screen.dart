
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_shop/export_files.dart';


class ProductScreen extends StatelessWidget {
  static const String routeName = '/product_screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductScreen(),
    );
  }

  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

