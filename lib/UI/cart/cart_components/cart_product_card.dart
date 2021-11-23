import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_shop/bloc/cart/cart_bloc.dart';
import 'package:pin_shop/model/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel product;

  const CartProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imgUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black,
                      ),
                ),
                Text(
                  '\$ ${product.price}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddCart(product));
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveCart(product));
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
