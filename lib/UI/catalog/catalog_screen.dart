import 'package:flutter/material.dart';
import 'package:pin_shop/model/category_model.dart';
import 'package:pin_shop/model/product_model.dart';
import 'package:pin_shop/ui/global_components/custom_bar/custom_app_bar.dart';
import 'package:pin_shop/ui/global_components/custom_bar/custom_nav_bar.dart';

import 'catalog_components/body.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog_screen';

  static Route route({required CategoryModel category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final CategoryModel category;
  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsByCategory = ProductModel.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomNavBar(),
      body: Body(productsByCategory: productsByCategory),
    );
  }
}
