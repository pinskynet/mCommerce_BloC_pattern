import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_shop/bloc/cart/cart_bloc.dart';
import 'package:pin_shop/bloc/wishlist/wishlist_bloc.dart';
import 'package:pin_shop/model/product_model.dart';
import 'package:pin_shop/ui/global_components/carousel/hero_carousel_card.dart';
import 'package:pin_shop/ui/global_components/custom_bar/custom_app_bar.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product_screen';

  static Route route({required ProductModel product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  final ProductModel product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<WishlistBloc>().add(AddWishlist(product));

                      const snackBar =
                          SnackBar(content: Text('Added to your wishlist.'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddCart(product));
                      Navigator.pushNamed(context, '/cart_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      'ADD TO CART',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [
              HeroCarouselCard(product: product),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '\$ ${product.price}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              iconColor: Colors.black,
              collapsedIconColor: Colors.black,
              title: Text(
                'Product Infomation',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.black,
                    ),
              ),
              children: [
                ListTile(
                  title: Text(
                    'Harry Hollingworth\'s 1911 investigation of the behavioral effects of caffeine is one of the earliest examples of psychological research contracted by a large corporation. The research was necessitated by a federal government suit against the Coca-Cola Company for marketing a beverage with a deleterious ingredient, namely, caffeine. Although Hollingworth\'s research played little role in the outcome of the Coca-Cola trials, it was important as a model of sophistication in experimental design. As such, it set a standard for psychopharmacological research. It also was particularly important in directing Hollingworth toward a life-long career in applied psychology.',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              iconColor: Colors.black,
              collapsedIconColor: Colors.black,
              title: Text(
                'Delivery Infomation',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.black,
                    ),
              ),
              children: [
                ListTile(
                  title: Text(
                    'Harry Hollingworth\'s 1911 investigation of the behavioral effects of caffeine is one of the earliest examples of psychological research contracted by a large corporation. The research was necessitated by a federal government suit against the Coca-Cola Company for marketing a beverage with a deleterious ingredient, namely, caffeine. Although Hollingworth\'s research played little role in the outcome of the Coca-Cola trials, it was important as a model of sophistication in experimental design. As such, it set a standard for psychopharmacological research. It also was particularly important in directing Hollingworth toward a life-long career in applied psychology.',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
