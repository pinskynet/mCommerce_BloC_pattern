import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pin_shop/UI/home/home_components/section_title.dart';
import 'package:pin_shop/model/category_model.dart';
import 'package:pin_shop/model/product_model.dart';

import 'hero_carousel_card.dart';
import 'product_carousel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: CategoryModel.categories
              .map((category) => HeroCarouselCard(category: category))
              .toList(),
        ),
        const SectionTitle(title: 'RECOMMENDED'),
        ProductCarousel(
            products: ProductModel.products
                .where((product) => product.isRecommended)
                .toList()),
        const SectionTitle(title: 'POPULAR'),
        ProductCarousel(
            products: ProductModel.products
                .where((product) => product.isPopular)
                .toList()),
      ],
    );
  }
}
