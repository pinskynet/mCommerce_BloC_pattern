// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_shop/bloc/wishlist/wishlist_bloc.dart';
import 'package:pin_shop/ui/global_components/custom_bar/custom_app_bar.dart';
import 'package:pin_shop/ui/global_components/custom_bar/custom_nav_bar.dart';
import 'package:pin_shop/ui/global_components/product/product_card.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist_screen';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => WishlistScreen(),
    );
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black,),
            );
          } else if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.4,
              ),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, index) {
                return Center(
                  child: ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 1.1,
                    leftPosition: 100,
                    isWishlist: true,
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'Something went wrong!',
                style: Theme.of(context).textTheme.headline1,
              ),
            );
          }
        },
      ),
    );
  }
}
