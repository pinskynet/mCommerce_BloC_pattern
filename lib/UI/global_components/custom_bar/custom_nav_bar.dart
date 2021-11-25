// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_shop/bloc/cart/cart_bloc.dart';
import 'package:pin_shop/bloc/checkout/checkout_bloc.dart';
import 'package:pin_shop/bloc/wishlist/wishlist_bloc.dart';
import 'package:pin_shop/model/product_model.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final ProductModel? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavbar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavbar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog_screen':
        return _buildNavBar(context);
      case '/wishlist_screen':
        return _buildNavBar(context);
      case '/product_screen':
        return _buildAddToCartNavBar(context, product);
      case '/cart_screen':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout_screen':
        return _buildOrderNowNavBar(context);
      default:
        _buildNavBar(context);
    }
  }

  List<Widget>? _buildNavBar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart_screen');
        },
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user_screen');
        },
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    ];
  }

  List<Widget>? _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(
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
    ];
  }

  List<Widget>? _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout_screen');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    ];
  }

  List<Widget>? _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context
                    .read<CheckoutBloc>()
                    .add(ConfirmCheckout(checkout: state.checkout));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Text(
                'ORDER NOW',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.black,
                    ),
              ),
            );
          } else {
            return Center(
              child: Text(
                'Something Went Wrong',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black),
              ),
            );
          }
        },
      ),
    ];
  }
}
