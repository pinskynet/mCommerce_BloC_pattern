import 'package:flutter/material.dart';
import 'package:pin_shop/model/product_model.dart';
import 'package:pin_shop/ui/global_components/product/product_card.dart';

class Body extends StatelessWidget {
  final List<ProductModel> productsByCategory;

  const Body({
    Key? key,
    required this.productsByCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.15,
      ),
      itemCount: productsByCategory.length,
      itemBuilder: (BuildContext context, index) {
        return ProductCard(
          product: productsByCategory[index],
          widthFactor: 2.2,
        );
      },
    );
  }
}
