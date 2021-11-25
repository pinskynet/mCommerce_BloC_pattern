// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_shop/bloc/cart/cart_bloc.dart';
import 'package:pin_shop/ui/global_components/custom_bar/custom_app_bar.dart';
import 'package:pin_shop/ui/global_components/custom_bar/custom_nav_bar.dart';
import 'package:pin_shop/ui/global_components/oder/order_summary.dart';

import 'cart_components/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart_screen';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home_screen');
                            },
                            child: Text(
                              'Add More Items',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              elevation: 0,
                              primary: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  OrderSummary(),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                'Something went wrong!',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}
